//
//  MessageViewController.swift
//  FancyHelloWorld
//
//  Created by Francisco Gutierrez on 2/18/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    var message: String?
    var messageSrc: Int?
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (messageSrc == 1) {
            messageLabel.text = "hello " + message!
        } else {
            messageLabel.text = message!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
