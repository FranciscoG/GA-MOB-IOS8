//
//  MyBaseTextInputStyle.swift
//  assignment-week4
//
//  Created by Francisco Gutierrez on 2/24/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import UIKit
import SnapKit

class MyViewComponents {
    
    func textField() -> UITextField {
        let txtField = UITextField()
        txtField.backgroundColor = UIColor.whiteColor()
        txtField.font = UIFont.systemFontOfSize(15)
        txtField.borderStyle = UITextBorderStyle.RoundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.No
        txtField.keyboardType = UIKeyboardType.Default
        txtField.returnKeyType = UIReturnKeyType.Done
        txtField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        txtField.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(40)
        }
        
        return txtField
    }
    
    
    func tableViewWithCell(reuseID: String) -> UITableView {
        let tV = UITableView()
        tV.backgroundColor = UIColor.whiteColor()
        tV.registerClass(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        return tV
    }
    
}
