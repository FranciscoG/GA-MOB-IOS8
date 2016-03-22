/*
//  SecondViewController.swift
//  Lesson07

 - This view controller should also contain a single text view.
 - When the view controller loads, it should read two values from NSUserDefaults, one String and one Double, using keys of your choosing.
 - These values should be set by a text field and slider, respectively, placed into the Settings Bundle of the app, accessible through the iOS "Settings" app.
 - This means you'll have to create a Settings Bundle, add a text field and slider to it, then give them values by navigating to Settings > "Your App's Name" to give those fields values.

 - For information about implementing a Settings Bundle (which utilizes NSUserDefaults), see the Apple Documentation.
*/

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textView2: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settingName = NSUserDefaults.standardUserDefaults().stringForKey("settings_name")
        let settingSlide = NSUserDefaults.standardUserDefaults().integerForKey("settings_slider")
        
        textView2.text = "\(settingName!) : \(settingSlide)"
        
    }
    
    
    
}
