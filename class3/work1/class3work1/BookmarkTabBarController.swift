
import UIKit

class BookmarkTabBarController: UITabBarController {

    @IBOutlet weak var bookmarkIcon: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        bookmarkIcon.badgeValue = nil;
    }
}
