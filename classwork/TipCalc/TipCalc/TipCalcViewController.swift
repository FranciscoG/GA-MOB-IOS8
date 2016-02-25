
import UIKit

class TipCalcViewController: UIViewController {

    @IBOutlet weak var amtTextField: UILabel!
    
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
   
    @IBAction func onTipSlide(sender: UISlider) {
        let origAmt = Float(amtTextField.text!)
        print(origAmt)
        
        if origAmt != nil {
            let tip = tipSlider.value
            let final = origAmt! + ( tip/100 * origAmt!)
            totalTextLabel.text = String(final)
        }
    }


}

