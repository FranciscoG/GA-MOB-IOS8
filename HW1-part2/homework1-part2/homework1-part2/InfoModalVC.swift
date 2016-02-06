//
//  InfoModalVC.swift
//  homework1-part2
//
//  Created by Francisco Gutierrez on 2/6/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class InfoModalVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var infoText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoText.text = "Hello!\n\nI'm a web developer living in NYC.  I like traveling, eating, coding, video games, tabletop gaming, and spending way too much on the internet. Hope you like my first app.  It's made from digital blood, sweat, and tears"
    }
    
    @IBAction func closeTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
}
