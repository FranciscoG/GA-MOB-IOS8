//
//  ViewController.swift
//  CustomTableViewCells
//
//  Created by Francisco Gutierrez on 3/1/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 5 {
            return tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath)
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(550) as! UILabel
        let label2 = cell.viewWithTag(36) as! UILabel
        let label3 = cell.viewWithTag(37) as! UILabel
        
        label.text = "\(indexPath.row + 1)"
        label2.text = "\(arc4random_uniform(25))"
        label3.text = "\(arc4random_uniform(400))"
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGrayColor()
            cell.viewWithTag(35)?.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor()
            cell.viewWithTag(35)?.backgroundColor = UIColor.yellowColor()
        }
        

        return cell
    }
    


}

