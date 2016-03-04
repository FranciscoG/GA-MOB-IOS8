
import UIKit

class TipCalcViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var origAmt : String?
    
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipSuggestTable: UITableView!
    @IBOutlet weak var tipSlider: UISlider!
   
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillHide(sender: NSNotification) {
       totalTextLabel.hidden = false
    }
    
    func keyboardWillShow(sender: NSNotification) {
        totalTextLabel.hidden = true
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountInput.becomeFirstResponder()
        amountInput.addTarget(self, action: "addItem:", forControlEvents: UIControlEvents.EditingDidEndOnExit)
        tipSuggestTable.hidden = true
    }
    
    @IBAction func onTipSlide(sender: UISlider) {
        if let amt = amountInput.text {
            origAmt = amt
            let tip = tipSlider.value
            totalTextLabel.text = getTipAmount(origAmt, tipArg: tip)
        }
    }
    
    func getTipAmount(inputAmt: String?, tipArg: Float) -> String {
        if let amt = inputAmt {
            let final = Float(amt)! * tipArg
            return String(final)
        } else {
            return ""
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tipSuggestionCell", forIndexPath: indexPath)
        
        switch indexPath.row {
        
        case 0:
            cell.textLabel?.text = "10% : " + getTipAmount(origAmt, tipArg: 0.10)
        case 1:
            cell.textLabel?.text = "15% : " + getTipAmount(origAmt, tipArg: 0.15)
        case 2:
            cell.textLabel?.text = "20% : " + getTipAmount(origAmt, tipArg: 0.20)
        default:
            break;
        }
        return cell
    }
    
    
    func addItem(textField: UITextField) {
        origAmt = amountInput.text!
        tipSuggestTable.reloadData()
        tipSuggestTable.hidden = false
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }


}

