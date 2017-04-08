//
//  ViewController.swift
//  MapKit Demo
//
//  Created by Jackie Thind on 3/16/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // set up buttons here
        let distanceSpan:CLLocationDegrees = 2000 // 2km
        let dojoLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.375578, -121.91007)// centered at this pin
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(dojoLocation, distanceSpan, distanceSpan), animated: true)
        let dojoLocationPin = DojoAnnotation(title: "Player", subtitle: "Location", coordinate: self.currentLocation!.coordinate)
        mapView.addAnnotation(dojoLocationPin)
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations[0]
     
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }


}
// locationManager?,stopUpdatingLocation()
