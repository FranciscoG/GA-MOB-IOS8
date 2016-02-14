//
//  ModulusController.swift
//  homework2
//
//  Created by Francisco Gutierrez on 2/13/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class ModulusController: UIViewController {
    
    @IBOutlet weak var NumberField: UITextField!
    @IBOutlet weak var ResultFied: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkEven(myInput: String) -> String {
        var resultText = myInput + " is "
        let num = Int(myInput)! % 2
        
        if num == 0 {
            resultText += "even"
        } else {
            resultText += "not even"
        }
        return resultText
    }
    
    @IBAction func CalcClicked(sender: AnyObject) {
        if NumberField.text == "" {
            ResultFied.text = "Should print 'is even' or 'is not even'"
        } else {
            ResultFied.text = checkEven(NumberField.text!)
        }
    }
    
}
