//
//  NYCViewController.swift
//  tables
//
//  Created by Francisco Gutierrez on 2/18/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//

import UIKit

class NYCViewController: UIViewController, UITableViewDataSource {

    var boroughs = [
        "manhattan",
        "brooklyn",
        "queens",
        "staten island",
        "bronx"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boroughs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("boroughCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = boroughs[indexPath.row]
        return cell
    }

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addB(sender: AnyObject) {
        boroughs.append("new jersey")
        tableView.reloadData()
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
