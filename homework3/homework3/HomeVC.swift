//
//  ViewController.swift
//  homework3
//
//  Created by Francisco Gutierrez on 2/15/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

// found this on StackOverflow but I forgot the link

class HomeVC: UIViewController {

    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var borderView: UIView!
    
    class Gradient {
        let colorTop = UIColor.whiteColor().CGColor
        let colorBottom = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0).CGColor
        
        let gl: CAGradientLayer
        
        init() {
            gl = CAGradientLayer()
            gl.colors = [ colorTop, colorBottom]
            gl.locations = [ 0.0, 1.0]
        }
    }
    
    let gradient = Gradient()
    
    // hide the navigation controller bar on the home page
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    // show the navigation controller bar when segue to another page from home
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).CGColor
        borderView.layer.cornerRadius = 30
        borderView.layer.masksToBounds = true
        
        swipeGesture.addTarget(self, action: "didSwipe")
        let backgroundLayer = gradient.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSwipe(){
        performSegueWithIdentifier("showMyModal", sender: nil)
    }
    
    @IBAction func displayTableTapped(sender: AnyObject) {
        performSegueWithIdentifier("AnimalTable", sender: nil)
    }

}

