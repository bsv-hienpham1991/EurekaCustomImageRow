//
//  CustomImageCell.swift
//  EurekaCustomImageRow
//
//  Created by Hien Pham on 3/18/20.
//  Copyright © 2020 BraveSoft Vietnam. All rights reserved.
//

import UIKit
import Eureka

public class CustomImageCell: Cell<UIImage>, CellType {
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override public func update() {
        super.update()
        thumbnailView.image = row.value
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        row.didSelect()
    }
}

public final class CustomImageRow: Row<CustomImageCell>, RowType {
    private let pickerPropagator: PickerPropagator = PickerPropagator()
    
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<CustomImageCell>(nibName: "CustomImageCell", bundle: Bundle.main)
        pickerPropagator.delegate = self
    }
    
    public override func customDidSelect() {
        super.customDidSelect()
        
        let picker = UIImagePickerController()
        picker.delegate = pickerPropagator
        cell.formViewController()?.present(picker, animated: true, completion: nil)
    }
}

extension CustomImageRow: PickerPropagatorDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            value = image
            updateCell()
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
