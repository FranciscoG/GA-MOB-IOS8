//
//  ViewController.swift
//  homework1
//
//  Created by Francisco Gutierrez on 1/31/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

func getRand() -> CGFloat{
    return CGFloat(drand48());
}
func getRandomColor() -> UIColor{
    return UIColor(red: getRand(), green: getRand(), blue: getRand(), alpha: 1.0);
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

