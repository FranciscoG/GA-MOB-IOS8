

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activitIndicator: UIActivityIndicatorView!
    @IBOutlet weak var favsBar: UISegmentedControl!
    @IBOutlet weak var addressBar: UITextField!
    
    var history : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        activitIndicator.hidesWhenStopped = true
        
        let settingLoadPrevious = NSUserDefaults.standardUserDefaults().boolForKey("load_previous")
        
        let peviousUrl = NSUserDefaults.standardUserDefaults().stringForKey("previous_url")
        
        if settingLoadPrevious && peviousUrl != nil {
            showNewUrl(peviousUrl!)
        } else {
            showNewUrl("http://www.nyt.com")
        }
        
        
        
        favsBar.selectedSegmentIndex = -1
    }
    
    func showNewUrl(url:String){
        var loadurl: NSURL?
        
        if !url.hasPrefix("http://") {
            loadurl = NSURL(string: "http://\(url)")
        } else {
            loadurl = NSURL(string: url)
        }
        let urlReq = NSURLRequest(URL:loadurl!)
        webView.loadRequest(urlReq)
        NSUserDefaults.standardUserDefaults().setValue(url, forKey: "previous_url")
        
        addressBar.text = url
        history.append(url)
    }
    
    @IBAction func loadNewUrl(sender: UITextField) {
        if let newUrl = sender.text {
            showNewUrl(newUrl)
        }
    }
    
    
    @IBAction func favsTapped(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: showNewUrl("nyt.com")
        case 1: showNewUrl("cnn.com")
        case 2: showNewUrl("guardian.co.uk")
        case 3: showNewUrl("cbs.com")
        case 4:
            favsBar.selectedSegmentIndex = -1
            performSegueWithIdentifier("historySegue", sender: nil)
        default:break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let historyViewC = segue.destinationViewController as! HistoryVC
        historyViewC.history = self.history
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true;
        activitIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activitIndicator.stopAnimating()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false;

    }


}

