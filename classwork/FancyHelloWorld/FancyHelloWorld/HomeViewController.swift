//
//  ViewController.swift
//  FancyHelloWorld
//
//  Created by Francisco Gutierrez on 2/18/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let msgVC = segue.destinationViewController as! MessageViewController
        
        if (segue.identifier == "first" ) {
            msgVC.message = nameInput.text
            msgVC.messageSrc = 1
        } else if (segue.identifier == "second") {
            msgVC.message = segue.identifier
            msgVC.messageSrc = 2
        }
    }


}

