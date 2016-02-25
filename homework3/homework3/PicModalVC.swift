//
//  PicModalVC.swift
//  homework3
//
//  Created by Francisco Gutierrez on 2/15/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class PicModalVC: UIViewController {
    
    @IBOutlet weak var gifView: FLAnimatedImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = NSBundle.mainBundle().pathForResource("creepy", ofType: "gif") {
            let data = NSData(contentsOfFile: path)
            gifView.animatedImage = FLAnimatedImage.init(animatedGIFData: data!)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.layer.backgroundColor = UIColor.blackColor().CGColor
        dispatch_async(dispatch_get_main_queue(), {
            self.performAnimation()
            
        })
        
    }
    
    func performAnimation() {
        
        UIView.animateWithDuration(3.0, delay: 0.2, options: [.CurveEaseOut, .AllowUserInteraction], animations: {
            self.view.layer.backgroundColor = UIColor(red: 100/255, green: 10/255 , blue: 10/255, alpha: 1.0).CGColor
            }, completion: nil)
        
    }
    
    
    @IBAction func dismissTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}
