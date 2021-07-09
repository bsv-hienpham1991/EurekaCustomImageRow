//
//  PickerPropagator.swift
//  EurekaCustomImageRow
//
//  Created by Hien Pham on 3/18/20.
//  Copyright © 2020 Hien Pham. All rights reserved.
//

import Foundation
import UIKit

protocol PickerPropagatorDelegate: AnyObject {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
}

class PickerPropagator: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    weak var delegate: PickerPropagatorDelegate?
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.imagePickerControllerDidCancel(picker)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        delegate?.imagePickerController(picker, didFinishPickingMediaWithInfo: info)
    }
}
