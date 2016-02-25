import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var prevRating: UILabel!
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var commentInput: UITextField!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var ratings : [String:DetailedRating] = [:]
    var currentImage : String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImage.image = UIImage(named: currentImage)
        fileNameLabel.text = currentImage + ".jpg"
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == UIEventSubtype.MotionShake {
            ratings[currentImage] = DetailedRating(fileName: currentImage, rating: .NotYetRated, comment: "")
            prevRating.text = "Not Yet Rated"
        }
    }

    func getNextImage() -> String {
        let diceRoll = arc4random_uniform(5) + 1
        return String(diceRoll)
    }
    
    func proceedToNextImage() {
        commentInput.text = ""
        currentImage = getNextImage()
        mainImage.image = UIImage(named: currentImage)
        if ratings[currentImage] == nil {
            prevRating.text = "Not Yet Rated"
        } else {
            prevRating.text = ratings[currentImage]?.rating.getDisplayValue()
        }
        fileNameLabel.text = currentImage + ".jpg"
        commentLabel.text = ratings[currentImage]?.comment
        timeLabel.text = ratings[currentImage]?.time
        commentInput.text = ratings[currentImage]?.comment


    }

    @IBAction func thumbsUpClicked(sender: AnyObject) {
        ratings[currentImage] = DetailedRating(fileName: currentImage, rating: .LovedIt, comment: commentInput.text!)
        proceedToNextImage()
    }
    
    @IBAction func thumbsDownClicked(sender: AnyObject) {
        ratings[currentImage] = DetailedRating(fileName: currentImage, rating: .MehedIt, comment: commentInput.text!)
        proceedToNextImage()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoStats" {
            let vc = segue.destinationViewController as! RatingsTableVC
            vc.ratingDetails = Array(self.ratings.values)
        }
    }
}

