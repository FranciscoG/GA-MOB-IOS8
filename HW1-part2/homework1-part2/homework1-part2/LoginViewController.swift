//
//  ViewController.swift
//  homework1-part2
//
//  Created by Francisco Gutierrez on 2/6/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

let normalBorderColor = UIColor( red: 30/255, green: 30/255, blue:30/255, alpha: 1.0 ).CGColor


func redesignInput(myTextField: UITextField) {
    // src: http://stackoverflow.com/a/28735138
    myTextField.layer.cornerRadius = 6.0
    myTextField.layer.masksToBounds = true
    myTextField.layer.borderColor = normalBorderColor
    myTextField.layer.borderWidth = 1.0
}

func failLogin(myTextField: UITextField) {
    myTextField.layer.borderColor = UIColor( red: 1, green: 0, blue:0, alpha: 1.0 ).CGColor
}

func checkPassword(un:String, pw:String) -> Bool {
    return (un == "me@gmail.com" && pw == "password1") ? true : false;
}


class LoginViewController: UIViewController {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup login input
        redesignInput(emailInput)
        emailInput.keyboardType = UIKeyboardType.EmailAddress
        
        // setup password input
        redesignInput(passwordInput)
        passwordInput.secureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginPressed(sender: UIButton!) {
        let isAllowed = checkPassword(emailInput.text!, pw: passwordInput.text!)
//        let isAllowed = true;
        
        if (isAllowed) {
            emailInput.layer.borderColor = normalBorderColor
            passwordInput.layer.borderColor = normalBorderColor
            performSegueWithIdentifier("homeSegue", sender: nil)
        } else {
            failLogin(emailInput)
            failLogin(passwordInput)
        }
        
    }
}

