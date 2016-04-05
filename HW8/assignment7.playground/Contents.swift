// Assignment 7 playground

import XCPlayground
import Foundation

// To include SwiftyJSON, download SwiftyJSON.swift from the repository at 
//   https://github.com/SwiftyJSON/SwiftyJSON/tree/master/Source
// Then expand the Navigator with CMD+1.
// Drag/drop the file from Finder into the "Sources" folder in the Navigator.


// Let asynchronous code run
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

/*********************************************************************
    Class to help keep things DRY
 */

class Get {
    var url: String
    
    init(url: String){
        self.url = url
    }
    
    func call(callback: (result: NSData?, response:NSURLResponse?, error:NSError?) -> Void){
        
        if let url = NSURL(string: self.url) {
            let sessionManager = NSURLSession.sharedSession()
            
            // trailing block syntax
            let task = sessionManager.dataTaskWithURL(url) { (data, response, error) -> Void in
                callback(result: data, response: response, error: error)
            }
            
            task.resume()
        } else {
            print("Not a valid url: \(self.url)" )
        }
        
    }
    
}


/*********************************************************************
    TODO one: Write and call a function that make a successful network 
    connection to google.com using core networking APIs, then print 
    out the results.
 */

var google = Get(url: "https://www.google.com")

google.call { (result, response, error) -> Void in
    if let result = result {
        let datastring = NSString(data: result, encoding: NSUTF8StringEncoding)
        print("Part 1: \(datastring)")
    }
    if let response = response as? NSHTTPURLResponse {
        print("Part 1 status: \(response.statusCode)")
    }
    if let error = error {
        print("Part 1 error: \(error.localizedDescription)")
    }
}

sleep(1)

/*********************************************************************
    TODO two: Write and call a function that makes a failing network 
    connection (using core networking APIs) to 
    http://generalassemb.ly/foobar.baz, a nonexistant page. 
    Print out the status code and body of the response.
 */

var foobaz = Get(url:"http://generalassemb.ly/foobar.baz")
    
foobaz.call{ (result, response, error) -> Void in
    
    if let response = response as? NSHTTPURLResponse {
        print("Part 2 status: \(response.statusCode)")
    }
    if let result = result {
        if let datastring = NSString(data: result, encoding: NSUTF8StringEncoding) {
            print("Part 2: \(datastring)")
        }
    }

}

sleep(1)

/********************************************************************
    TODO three: Make a successful network connection to 
    http://api.openweathermap.org/data/2.5/weather?q=New%20York,US
    an API that speaks JSON using core networking APIs. Create a model 
    class that corresponds to the JSON response object, populate it with 
    the contents of that JSON using NSJSONSerialization, then print 
    out the model.
*/

class WeatherModel {
    /* this is the API's response, my model will only care about the most important parts
    {
        "coord":{"lon":-74.01,"lat":40.71},
        "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],
        "base":"stations",
        "main":{"temp":30.61,"pressure":1018,"humidity":74,"temp_min":28.4,"temp_max":33.8},
        "visibility":16093,
        "wind":{"speed":11.41,"deg":20,"gust":7.2},
        "clouds":{"all":90},
        "dt":1459825341,
        "sys":{"type":1,"id":1972,"message":0.0577,"country":"US","sunrise":1459852324,"sunset":1459898737},
        "id":5128581,
        "name":"New York",
        "cod":200
    }
    */
    var desc: String?
    var temp : Float?
    var min : Float?
    var max : Float?
    var location : String?
    
    func oldWay(data:NSData) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
            let weather = json.valueForKey("weather")?.firstItem as? NSDictionary
            self.desc = weather?.valueForKey("description") as? String
            let main = json.valueForKey("main") as? NSDictionary
            self.temp = main?.valueForKey("temp") as? Float
            self.min = main?.valueForKey("temp_min") as? Float
            self.max = main?.valueForKey("temp_max") as? Float
            self.location = json.valueForKey("name") as? String
        } catch {
            print("Invalid JSON")
        }
    }
    
    func swiftyWay(data:NSData) {
        let json = JSON(data: data)
        self.desc = json["weather"][0]["description"].stringValue
        self.temp = json["main"]["temp"].floatValue
        self.min = json["main"]["temp_min"].floatValue
        self.max = json["main"]["temp_max"].floatValue
        self.location = json["name"].stringValue
    }

    func getWeather()->String? {
        return "The weather in \(self.location!) is \(self.temp!)F with a low of \(self.min!)F and a high of \(self.max!)F"
    }
    
    func getAPIUrl()-> String{
        let weatherAPIUrl = "http://api.openweathermap.org/data/2.5/weather"
        let apiKey = "e7a026e17b80a4c4d4b5ede037238f85" // this API key might not work, you'll have to sub in your own
        let city = "New York,US"
        let escapedString = city.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
        return "\(weatherAPIUrl)?q=\(escapedString)&units=imperial&APPID=\(apiKey)"
    }

}

let weathaModel = WeatherModel()
var weatha = Get(url: weathaModel.getAPIUrl())
weatha.call { (result, response, error) -> Void in
    if let response = response as? NSHTTPURLResponse {
        print("Part 3 status: \(response.statusCode)")
    }
    if let error = error {
        print("Part 3: error - \(error.localizedDescription)")
    }
    if let result = result {
        weathaModel.oldWay(result)
        if let temp = weathaModel.getWeather() {
            print("Part 3: \(temp)")
        }
        
    }
}


sleep(2)

/*******************************************************************
    TODO four: Make a successful network connection to 
    http://api.openweathermap.org/data/2.5/weather?q=New%20York,US
    an API that speaks JSON. Populate a your above-defined model with 
    the contents of that JSON using SwiftyJSON, then print out the model.
 */

let swiftyWeatherModel = WeatherModel()
var swiftyWeather = Get(url: swiftyWeatherModel.getAPIUrl())
swiftyWeather.call { (result, response, error) -> Void in
    if let response = response as? NSHTTPURLResponse {
        print("Part 4 status: \(response.statusCode)")
    }
    if let error = error {
        print("Part 4: error - \(error.localizedDescription)")
    }
    if let result = result {
        swiftyWeatherModel.swiftyWay(result)
        if let temp = swiftyWeatherModel.getWeather() {
            print("Part 4: \(temp)")
        }
    }
}
