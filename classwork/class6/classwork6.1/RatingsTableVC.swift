//
//  RatingsTableVC.swift
//  classwork6.1
//
//  Created by Francisco Gutierrez on 2/16/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class RatingsTableVC: UITableViewController {
    
    var ratingDetails : [DetailedRating] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.ratingDetails.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ratings", forIndexPath: indexPath)

        cell.textLabel?.text = ratingDetails[indexPath.row].friendlyDisplay()
        
        let image : UIImage = UIImage(named: ratingDetails[indexPath.row].fileName)!
        cell.imageView!.image = image

        return cell
    }

}
