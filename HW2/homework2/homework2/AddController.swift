//
//  AddController.swift
//  homework2
//
//  Created by Francisco Gutierrez on 2/13/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    
    @IBOutlet weak var NumberField: UITextField!
    @IBOutlet weak var AddOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    var outerNum:Int = 0;
    var result = "";
    var multiplier:Int = 1;
    
    func getResult(numText: String) -> String {
        let num = Int(NumberField.text!)!
        
        if (outerNum != num) {
            outerNum = num;
            result = "";
            multiplier = 1;
        }
        
        if result == "" {
            result = NumberField.text!
            return result + " + 0 = " + result;
        }
        
        multiplier++
        result += " + " + numText
        return result + " = " + String(num * multiplier)
    }
    
    @IBAction func AddClicked(sender: AnyObject) {
        if NumberField.text == "" {
            result = "";
            AddOutput.text = result;
        } else {
            AddOutput.text = getResult(NumberField.text!)
            AddOutput.sizeToFit()
        }
    }
    
}
