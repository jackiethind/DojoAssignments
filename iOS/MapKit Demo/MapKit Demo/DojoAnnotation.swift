//
//  DojoAnnotation.swift
//  MapKit Demo
//
//  Created by Jackie Thind on 3/16/17.
//  Copyright © 2017 Jackie Thind. All rights reserved.
//

import MapKit

class DojoAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
//    var mapPinDescription: String{
//        return "\(title): \(subtitle)"
//    }
}
