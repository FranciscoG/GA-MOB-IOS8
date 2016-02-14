//
//  ViewController.swift
//  homework2
//
//  Created by Francisco Gutierrez on 2/10/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

// dismiss keyboard src: http://stackoverflow.com/a/27079103

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var AgeInput: UITextField!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkAge(age: Int) -> String {
        var allowed : String = "";
        
        switch age {
        case 0...15:
            allowed = "You can't do much now but stop worrying and enjoy being young!"
            break;
        case 16...17:
            allowed = "You can drive"
            break
        case 18...20:
            allowed = "You can drive and vote"
            break
        case let x where x > 20:
            allowed = "You can vote, drive, and drink (but not at the same time!)."
            break;
        default:
            allowed = "Something wrong?"
        }
        
        return allowed;
    }
    
    @IBAction func GenerateTextClicked(sender: AnyObject) {
        if NameInput.text == "" && AgeInput.text == "" {
            Label.text = "Hello World!"
        } else {
            Label.text = checkAge(Int(AgeInput.text!)!)
        }
    }

}

