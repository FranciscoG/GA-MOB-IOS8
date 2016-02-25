//
//  BeatlesViewController.swift
//  tables
//
//  Created by Francisco Gutierrez on 2/18/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class BeatlesViewController: UIViewController, UITableViewDataSource {

    var beatles = ["george", "john", "paul", "john"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beatles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("beatlesCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        
        if (row % 2 == 0) {
            cell.backgroundColor = UIColor.blueColor()
        }
        cell.textLabel?.text = beatles[row]
        return cell
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
