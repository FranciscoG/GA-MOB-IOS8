/*
TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.

TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.

TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
*/

import UIKit
import SnapKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var pairList : [String:String] = [:]
    
    lazy var leftTextField = MyViewComponents().textField()
    lazy var rightTextField = MyViewComponents().textField()
    lazy var pairListTable = MyViewComponents().tableViewWithCell("pairItem")
    
    func addItem(textField: UITextField) {
        pairList[leftTextField.text!] = rightTextField.text
        leftTextField.text = ""
        rightTextField.text = ""
        pairListTable.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillHide(sender: NSNotification) {
        leftTextField.backgroundColor = UIColor.redColor()
        rightTextField.backgroundColor = UIColor.redColor()
    }
    
    func keyboardWillShow(sender: NSNotification) {
        leftTextField.backgroundColor = UIColor.blueColor()
        rightTextField.backgroundColor = UIColor.blueColor()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None; // make views start under the Navigation bar
        
        self.view.addSubview(leftTextField)
        leftTextField.becomeFirstResponder()
        leftTextField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).multipliedBy(0.46)
            make.top.equalTo(super.view).offset(10)
            make.left.equalTo(super.view).offset(10)
        }
        
        self.view.addSubview(rightTextField)
        rightTextField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view).multipliedBy(0.46)
            make.top.equalTo(super.view).offset(10)
            make.left.equalTo(leftTextField.snp_right).offset(10)
        }
        rightTextField.addTarget(self, action: "addItem:", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        
        self.view.addSubview(pairListTable)
        pairListTable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(rightTextField.snp_bottom).offset(5)
            make.width.equalTo(self.view).multipliedBy(0.95)
            make.bottom.equalTo(self.view).offset(-10)
            make.centerX.equalTo(self.view)
        }
        // make data work
        pairListTable.dataSource = self;
        pairListTable.delegate = self;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("pairItem", forIndexPath: indexPath)
        let index = pairList.startIndex.advancedBy(indexPath.row)
        let key = pairList.keys[index]
        
        cell.textLabel?.text = key + "  :  " + pairList[key]!
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pairList.count
    }
}
