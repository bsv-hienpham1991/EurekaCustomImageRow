//
//  ViewController.swift
//  EurekaCustomImageRow
//
//  Created by Hien Pham on 3/18/20.
//  Copyright © 2020 Hien Pham. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        form +++ Section("Section1")
            <<< CustomImageRow() { row in
            }.cellSetup({ (cell, row) in
                cell.height = { 100 }
            })
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.cellForRow(at: indexPath) is CustomImageCell {
            return nil
        }
        return super.tableView(tableView, willSelectRowAt: indexPath)
    }
}

