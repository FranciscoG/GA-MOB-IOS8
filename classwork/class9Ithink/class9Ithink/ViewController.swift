//
//  ViewController.swift
//  class9Ithink
//
//  Created by Francisco Gutierrez on 2/25/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var purpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRect(x:(self.view.bounds.width / 2) - (100/2), y: 20, width: 100, height:20))
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.setTitle("tap me", forState: .Normal)
        btn.addTarget(self, action: "tapMeClicked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }
    
    func tapMeClicked(){
        UIView.animateWithDuration(0.35) { () -> Void in
            self.greenView.backgroundColor = UIColor.blueColor()
        }
        
        UIView.animateWithDuration(1) { () -> Void in
            self.purpView.frame.origin.x = -self.view.bounds.width
            self.purpView.frame.origin.y += 50
            self.view.setNeedsLayout()
        }
        
    }


    @IBAction func buttonTapped(sender: AnyObject) {
        UIView.animateWithDuration(1) { () -> Void in
            self.purpView.frame.origin.x = self.view.bounds.width
            self.purpView.frame.origin.y -= 50
            self.view.setNeedsLayout()
        }
        UIView.animateWithDuration(0.35) { () -> Void in
            self.greenView.backgroundColor = UIColor.greenColor()
        }
        
        
    }

}

