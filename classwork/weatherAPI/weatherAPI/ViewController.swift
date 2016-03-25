
import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var weatherResult: UITextView!
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeAPIUrl(city:String)->String {
        
        let apiBaseURL = "http://api.openweathermap.org/data/2.5/weather"
        let apiKey = "ddf2b16294f8884204a373331e615187"
        
        if let escapedString = city.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) {
            return "\(apiBaseURL)?q=\(escapedString)&units=imperial&APPID=\(apiKey)"
        } else {
            return ""
        }
    }
    
    func getCityTemp(city:String){
        weak var weakSelf = self
        let cityURL = self.makeAPIUrl(city)
        
        if let url = NSURL(string: cityURL) {
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
                    
                    let json = JSON(data: data)
                    let temp = json["main"]["temp"].double
                    
                    if let temp = temp {
                        dispatch_sync(dispatch_get_main_queue(), {() -> Void in
                            weakSelf!.weatherResult.text = "The temp in \(city) is \(temp) degrees Farenheit"
                        })
                    }
                    
                } else {
                    print("could not get data back")
                }
                
            }
            
            task.resume()
        } else {
            print("Not a valid url")
        }

    }
    
    @IBAction func searchTapped(sender: UIButton) {
        self.getCityTemp(cityTextField.text!)
    }
    
    

}

