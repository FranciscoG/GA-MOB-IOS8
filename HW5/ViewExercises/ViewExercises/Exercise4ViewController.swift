//
//  Exercise4ViewController.swift
//  ViewExercises
//
//  Created by William Martin on 1/22/16.
//  Copyright © 2016 Anomalus. All rights reserved.
//

import UIKit

class Exercise4ViewController: UIViewController {

    @IBOutlet weak var tapBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapBtn.backgroundColor = UIColor.greenColor()
        tapBtn.layer.borderColor = UIColor.redColor().CGColor
        tapBtn.layer.borderWidth = 1

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var tapped : Bool = false
    @IBAction func btnTapped(sender: AnyObject) {
        if !tapped {
            tapBtn.backgroundColor = UIColor.redColor()
            tapped = true
        } else {
            tapBtn.backgroundColor = UIColor.greenColor()
            tapped = false
        }
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
