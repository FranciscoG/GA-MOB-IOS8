import UIKit

func getRanFloat(x:UInt32) -> CGFloat {
    let ranFloat = CGFloat(arc4random_uniform(x))/100.0
    return ranFloat
}
func getRanColor() -> UIColor {
    return UIColor(red: getRanFloat(100), green: getRanFloat(100), blue: getRanFloat(100), alpha: 1.0)
}

class RandomColorVC: UIViewController {

    @IBOutlet weak var BloopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BloopClicked(sender: AnyObject) {
        view.backgroundColor = getRanColor()
    }
    
}

