//
//  TextViewController.swift
//  lesson2
//
//  Created by Francisco Gutierrez on 1/28/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class TextViewController: UINavigationController {

    @IBOutlet weak var favoritesButton: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        favoritesButton.badgeValue = nil;
        
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
