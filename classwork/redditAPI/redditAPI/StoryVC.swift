//
//  StoryVC.swift
//  redditAPI
//
//  Created by Francisco Gutierrez on 3/24/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class StoryVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var storyoLoad : NSURLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let storyoLoad = storyoLoad {
            webView.loadRequest(storyoLoad)
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
