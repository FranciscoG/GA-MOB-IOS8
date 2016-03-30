// Assignment 7 playground

import XCPlayground
import Foundation


// To include SwiftyJSON, download SwiftyJSON.swift from the repository at 
//   https://github.com/SwiftyJSON/SwiftyJSON/tree/master/Source
// Then expand the Navigator with CMD+1.
// Drag/drop the file from Finder into the "Sources" folder in the Navigator.


// Let asynchronous code run
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

func getURL(url:String, callback: (result: NSData, response:NSURLResponse, error:NSError) -> Void){
    
    if let url = NSURL(string: url) {
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
                
                callback(result: data)
                
            } else {
                print("could not get data back")
            }
            
        }
        
        task.resume()
    } else {
        print("Not a valid url")
    }
    
}

getURL("http://www.google.com") { (result) -> Void in
    let datastring = NSString(data: result, encoding: NSUTF8StringEncoding)
    print(datastring)
}

//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

