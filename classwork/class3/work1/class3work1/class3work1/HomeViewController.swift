import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var inputField: UITextField!

    @IBOutlet weak var outputLabel: UITextView!
    
    
    @IBAction func hiClicked(sender: AnyObject) {
        outputLabel.text = "hello " + inputField.text!
    }

}

