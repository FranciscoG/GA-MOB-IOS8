//
//  SixthViewController.swift
//  Lesson07
/*
    - Then when view controller #6 loads, read the saved Array from the property list file, join its elements by single spaces into a single String, then display that String in the text view.
*/

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var textView6: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let readArray = NSArray(contentsOfURL: Helpers().getUrlForDocument("fivevc.plist")) {
            textView6.text = readArray.componentsJoinedByString(" ")
        }
    }

    

}
