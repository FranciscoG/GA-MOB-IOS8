//
//  ViewController.swift
//  homework1
//
//  Created by Francisco Gutierrez on 1/31/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

// http://classictutorials.com/2014/08/generate-a-random-color-in-swift/
func getRandomColor() -> UIColor{
    
    let randomRed:CGFloat = CGFloat(drand48());
    
    let randomGreen:CGFloat = CGFloat(drand48());
    
    let randomBlue:CGFloat = CGFloat(drand48());
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0);
    
}

class DeathViewController: UIViewController {
    
    @IBOutlet weak var booButton: UIButton!
    @IBOutlet weak var DeathView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad();
        booButton.layer.cornerRadius = 50;
        booButton.layer.borderWidth = 1;
        booButton.layer.borderColor = UIColor.whiteColor().CGColor;
    }
    
    
    @IBAction func ButtonClicked(sender: AnyObject) {
        DeathView.backgroundColor = getRandomColor();
    }
    
    
}

