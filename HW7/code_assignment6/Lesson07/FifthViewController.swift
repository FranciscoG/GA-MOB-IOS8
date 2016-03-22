//
//  FIfthViewController.swift
//  Lesson07

/*

- View controllers #5 and #6 should each contain a single text view.
- When view controller #5 dismisses, it should save all the words in the text view into an Array of Strings stored in a property list file. For example, "a b c" will be saved as ["a", "b", "c"].

*/

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView5: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveTextToPlist(str:String, file:String){
        let saveArray = str.componentsSeparatedByString(" ") as NSArray
        saveArray.writeToURL(Helpers().getUrlForDocument(file), atomically: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.destinationViewController.title)
        if segue.destinationViewController.title == "SixthView" {
            self.saveTextToPlist(textView5.text, file: "fivevc.plist")
        }
    }
    
    


}
