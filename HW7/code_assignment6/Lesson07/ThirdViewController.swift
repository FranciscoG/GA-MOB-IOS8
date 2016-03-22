/*
//  ThirdViewController.swift
//  Lesson07

    - View controller #4 should contain a single text view.
    - When the user taps the "Next" button, save the text in this text view into a flat file.
    
*/

import UIKit


class ThirdViewController: UIViewController {

    @IBOutlet weak var textView3: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // check which Segue I'm doing
        // save to text file
        print(segue.destinationViewController.title)
        if segue.destinationViewController.title == "FourthView" {
            let saveSuccess = Helpers().saveToFile(textView3.text, dest: "vc3.txt")
        }
    }
    

    
}
