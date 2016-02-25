import UIKit

class ShoppingListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var listItems: UITableView!
    
    var shoppingListItems : [String] = []
    
    @IBOutlet weak var shoppingListTextField: UITextField!

   
    @IBAction func addItem(sender: AnyObject) {
        shoppingListItems.append(shoppingListTextField.text!)
        
        shoppingListTextField.text = ""
        listItems.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listItems.dataSource = self
        listItems.delegate = self
        shoppingListTextField.becomeFirstResponder()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shoppingItem", forIndexPath: indexPath)
        
        cell.textLabel?.text = shoppingListItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListItems.count
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
        } else {
            cell?.accessoryType = .Checkmark
        }
        cell?.selected = false
    }
    
}

