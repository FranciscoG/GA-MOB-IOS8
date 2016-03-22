import UIKit

class HistoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.dataSource = self
        historyTable.delegate = self
    }

    @IBAction func closeTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getUrlForDocument(documentName:String)->NSURL{
        let fileMgr = NSFileManager.defaultManager()
        let urls = fileMgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let directory = urls.first!
        
        return directory.URLByAppendingPathComponent(documentName, isDirectory: false)
    }
    
    @IBAction func saveHsitory() {
        let saveArray = history as NSArray
        saveArray.writeToURL(getUrlForDocument("history.plist"), atomically: true)
    
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        let dateString = formatter.stringFromDate(NSDate())
        
        do {
            try dateString.writeToURL(getUrlForDocument("timestamp.txt"), atomically: true, encoding: NSUTF8StringEncoding)
        } catch {
            print("save timestamp error")
        }
        
    }
    
    @IBAction func loadHistory() {
        let readArray = NSArray(contentsOfURL: getUrlForDocument("history.plist"))
        self.history = readArray as! [String]
        self.historyTable.reloadData()
        
        do {
            let output = try String(contentsOfURL: getUrlForDocument("timestamp.txt"))
            print(output)
        } catch {
            print("error loading history.plist")
        }
    }
    
    
    var history = [
        "http://www.nyt.com",
        "http://www.google.com",
        "http://ga.co"
    ]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyItemCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    

}
