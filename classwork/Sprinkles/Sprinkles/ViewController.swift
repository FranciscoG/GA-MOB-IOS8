//
//  ViewController.swift
//  Sprinkles
//
//  Created by Francisco Gutierrez on 3/1/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRandomViews()
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent!) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            self.addRandomViews()
        }
    }
    
    func addRandomViews() {
        
        let subViews = self.view.subviews

        for subView in subViews {
            subView.removeFromSuperview()
        }
        
        for i in 1...10 {
            let randomView = UIView(frame: getRandomRect(i))
            randomView.backgroundColor = getRandomColor()
            randomView.alpha = 0
            
            let duration = NSTimeInterval( Float(i) * 0.6 )
            UIView.animateWithDuration(duration, animations: { () -> Void in
                randomView.frame = self.getRandomRect(i)
                randomView.alpha = 1
            })
            self.view.addSubview(randomView)
        }
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48());
        let randomGreen:CGFloat = CGFloat(drand48());
        let randomBlue:CGFloat = CGFloat(drand48());
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0);
        
    }
    
    func getRandomRect(extra:Int) -> CGRect {
        let randomX = extra + Int(arc4random_uniform(300))
        let randomY = extra + Int(arc4random_uniform(600))
        let randomW = extra + Int(arc4random_uniform(200))
        let randomH = extra + Int(arc4random_uniform(200))
        return CGRect(x: randomX, y: randomY, width: randomW, height: randomH)
    }
    

}

