//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let redditAPI = "https://www.reddit.com/user/fgutz/m/webdev.json"

let woeid = "2459115"
let weatherURL = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20%3D%20\(woeid)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"

if let url = NSURL(string: weatherURL) {
    let sessionManager = NSURLSession.sharedSession()
    
    // trailing block syntax
    let task = sessionManager.dataTaskWithURL(url) { (data, response, error) -> Void in
        
        if let error = error {
            print("Got an error: \(error.localizedDescription)")
            return
        }
        
        if let response = response as? NSHTTPURLResponse {
            print(response.statusCode)
        }
        
        if let data = data {
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
                
                let query = json.valueForKey("query") as? NSDictionary
                let results = query?.valueForKey("results") as? NSDictionary
                let channel = results?.valueForKey("channel") as? NSDictionary
                let item = channel?.valueForKey("item") as? NSDictionary
                let condition = item?.valueForKey("condition") as? NSDictionary
                let temp = condition?.valueForKey("temp") as? String
                
                print("current weather is \(temp) degrees!")
                
            } catch {
                print("Invalid JSON")
            }

        } else {
            print("could not get data back")
        }
        
    }
    
    task.resume()
} else {
    print("Not a valid url")
}






