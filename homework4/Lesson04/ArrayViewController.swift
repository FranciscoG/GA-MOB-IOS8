//
//  ViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit
import SnapKit

/*
TODO one: Add a table view AND a text input box to this view controller, either in code or via the storyboard. Accept keyboard input from the text view when the return key is pressed. Add the string that was entered into the text view into an array of strings (stored in this class).

TODO two: Make this class a UITableViewDelegate and UITableViewDataSource that supply the above table view with cells. These cells should correspond to the text entered into the text box. E.g. If the text "one", then "two", then "three" was entered into the text box, there should be three cells in this table view that contain those strings in order.

*/


class ArrayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var itemList : [String] = ["hello"]
    
    lazy var listTextInput = MyViewComponents().textField()
    lazy var listTable = MyViewComponents().tableViewWithCell("singleItem")
    
    func addItem(textField: UITextField) {
        itemList.append(listTextInput.text!)
        listTextInput.text = ""
        listTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.dismissViewControllerAnimated(false, completion: nil)
        
        self.edgesForExtendedLayout = UIRectEdge.None; // make views start under the Navigation bar
        
        self.dismissViewControllerAnimated(false, completion: { () -> Void in
            self.view.backgroundColor = UIColor.blueColor()
        })
        self.view.backgroundColor = UIColor.redColor()
        
        
        self.view.addSubview(listTextInput)
        listTextInput.becomeFirstResponder()
        listTextInput.addTarget(self, action: "addItem:", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        
        // now let's use SnapKit to make AutoLayout easier!
        listTextInput.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).multipliedBy(0.95)
            make.centerX.equalTo(self.view)
            make.top.equalTo(super.view).offset(10)
        }
        
        self.view.addSubview(listTable)
        listTable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(listTextInput.snp_bottom).offset(5)
            make.width.equalTo(self.view).multipliedBy(0.95)
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
        }
        // make data work
        listTable.dataSource = self;
        listTable.delegate = self;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("singleItem", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    
}

