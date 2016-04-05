//
//  ViewController.swift
//  maps
//
//  Created by Francisco Gutierrez on 3/31/16.
//  Copyright © 2016 Francisco Gutierrez. All rights reserved.
//
// [CLLocationManager requestWhenInUseAuthorization] or -[CLLocationManager requestAlwaysAuthorization]

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geo = CLGeocoder()
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var addressSearch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            
            let location = CLLocationCoordinate2D(latitude: 40.739527, longitude: -73.989680)
            updateMap(location, title:"home", subtitle: "home")
//            mapView.showsUserLocation = true
        }
    }
    
    func updateMap(location:CLLocationCoordinate2D, title:String?, subtitle: String?){
        let camera = MKMapCamera(lookingAtCenterCoordinate: location, fromDistance: 1000, pitch: 45.0, heading: 0)
        mapView.setCamera(camera, animated: true)
        let searchPin = MapAnnotation(coordinate: location, title: title, subtitle: subtitle)
        self.mapView.addAnnotation(searchPin)
        self.spinner.stopAnimating()
    }
    
    
    @IBAction func searchTapped(sender: AnyObject) {
        spinner.startAnimating()
        if let str = addressSearch.text {
            geo.geocodeAddressString(str, completionHandler: { (placemarks: [CLPlacemark]?, error:NSError?) -> Void in
                if let placemarks = placemarks {
                    if let firstresult = placemarks.first {
                        print(firstresult)
                        if let loc = firstresult.location?.coordinate {
                            self.updateMap(loc, title: firstresult.name, subtitle: firstresult.subThoroughfare)
                        }
                    }
                }
            })
        }
    }

}


class MapAnnotation : NSObject, MKAnnotation {
    @objc var coordinate : CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle:String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
}

