//
//  FourthViewController.swift
/*
    - When the next view controller loads (#5), read that same file and display its contents in its single text view.

*/

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textView4: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView4.text = Helpers().readFromFile("vc3.txt")
    }

    

}
