import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var prevRating: UILabel!
    
    enum RatingType {
        case NotYetRated
        case LovedIt
        case MehedIt
        
        func getDisplayValue () -> String {
            switch self {
                case .NotYetRated: return "Not Yet Rated"
                case .LovedIt: return "Loved It 😍"
                case .MehedIt: return  "Meh 💩"
            }
        }
    }
    
    var ratings : [String:RatingType] = [:]
    var currentImage : String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.image = UIImage(named: currentImage)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == UIEventSubtype.MotionShake {
            ratings[currentImage] = .NotYetRated
            prevRating.text = "Not Yet Rated"
        }
    }

    func getNextImage() -> String {
        let diceRoll = arc4random_uniform(5) + 1
        return String(diceRoll)
    }
    
    func proceedToNextImage() {
        currentImage = getNextImage()
        mainImage.image = UIImage(named: currentImage)
        if ratings[currentImage] == nil {
            prevRating.text = "Not Yet Rated"
        } else {
            prevRating.text = ratings[currentImage]?.getDisplayValue()
        }

    }

    @IBAction func thumbsUpClicked(sender: AnyObject) {
        ratings[currentImage] = .LovedIt
        proceedToNextImage()
    }
    
    @IBAction func thumbsDownClicked(sender: AnyObject) {
        ratings[currentImage] = .MehedIt
        proceedToNextImage()
    }
}

