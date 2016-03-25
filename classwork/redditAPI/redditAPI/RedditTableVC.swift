import UIKit
import SwiftyJSON
import Alamofire

class RedditTableVC: UITableViewController {
    
    var stories : [JSON] = []
//    var refreshControl : UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "getDataFromReddit", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl!)
        getDataFromReddit()
    }
    
    func getDataFromReddit() {
        
        Alamofire.request(.GET, "https://www.reddit.com/.json").responseData { response in
            if let data = response.data {
                let json = JSON(data: data)

                
                self.stories = json["data"]["children"].arrayValue
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                })
                
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories.count
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedStory = stories[indexPath.row]
        let webUrlString = selectedStory["data"]["url"].stringValue
        let webUrl = NSURL(string: webUrlString)
        let webURLReq = NSURLRequest(URL: webUrl!)
        performSegueWithIdentifier("web", sender: webURLReq)
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("redditPost", forIndexPath: indexPath)

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
