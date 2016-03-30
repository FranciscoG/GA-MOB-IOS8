import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class RedditTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var stories : [JSON] = []
    var phImage : UIImage?
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mySegments: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(tableView, action: "getDataFromReddit", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
        getDataFromReddit("home")
        phImage = UIImage(named: "noimage")
        mySegments.selectedSegmentIndex = 0
    }
    
    func getDataFromReddit(subreddit:String) {
        var sub = "";
        if subreddit != "home" {
          sub = "r/" + subreddit
        }
        Alamofire.request(.GET, "https://www.reddit.com/\(sub).json").responseData { response in
            if let data = response.data {
                let json = JSON(data: data)

                self.stories = json["data"]["children"].arrayValue
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.refreshControl.endRefreshing()
                    self.tableView.reloadData()
                })
                
            }
        }
    }
    
    @IBAction func subsTapped(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0: getDataFromReddit("home")
        case 1: getDataFromReddit("aww")
        case 2: getDataFromReddit("funny")
        case 3: getDataFromReddit("gifs")
        default: getDataFromReddit("home")
        }
    }
    

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedStory = stories[indexPath.row]
        let webUrlString = "http://m.reddit.com" + selectedStory["data"]["permalink"].stringValue
        let webUrl = NSURL(string: webUrlString)
        let webURLReq = NSURLRequest(URL: webUrl!)
        performSegueWithIdentifier("web", sender: webURLReq)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditPost", forIndexPath: indexPath)
        
        cell.imageView?.image = nil
        
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: phImage!.size,
            radius: 5.0
        )
        
        let imageUrl = stories[indexPath.row]["data"]["thumbnail"].stringValue
        
        if let imgUrl = NSURL(string: imageUrl) {
            cell.imageView?.af_setImageWithURL(imgUrl, placeholderImage: phImage, filter: filter, imageTransition: .CrossDissolve(0.5), runImageTransitionIfCached: false, completion: { (response) -> Void in
                cell.setNeedsLayout()
            })
        }
        
        cell.textLabel?.text = stories[indexPath.row]["data"]["title"].stringValue
        return cell
    }



    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "web" {
            if let storyVC = segue.destinationViewController as? StoryVC {
                storyVC.storyoLoad = sender as? NSURLRequest
            }
            
        }
    }

}
