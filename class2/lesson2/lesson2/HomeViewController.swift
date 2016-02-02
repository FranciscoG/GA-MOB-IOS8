//
//  ViewController.swift
//  lesson2
//
//  Created by Francisco Gutierrez on 1/28/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var nameInputField: UITextField!
    @IBOutlet weak var nameOutputField: UITextView!

    
    @IBAction func sayHello(sender: AnyObject){
        nameOutputField.text = "Hello " + nameInputField.text!;

    }

}

