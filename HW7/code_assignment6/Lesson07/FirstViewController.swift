/*
    FirstViewController.swift
    Lesson07

    - The view controller should contain a text view that displays the values of the keys test_string and test_number from NSUserDefaults.

    -There should be a button titled "Next" in the navigation bar that when tapped segues to the next view controller below.
*/

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test_string = NSUserDefaults.standardUserDefaults().stringForKey("test_string")
        let test_number = NSUserDefaults.standardUserDefaults().integerForKey("test_number")
        
        textView.text = "\(test_string!) : \(test_number)"
        
    }
    
    
    
    
}