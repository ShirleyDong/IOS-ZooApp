//
//  LocationAnnotation.swift
//  ZooApp
//
//  Created by Tianxia Dong on 28/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    var mName: String?
    var mLocation: String?
    var coordinate: CLLocationCoordinate2D
    
    init(mName: String, mLocation:String, coordinate:CLLocationCoordinate2D) {
        self.mName = mName
        self.mLocation = mLocation
        self.coordinate = coordinate
        
        
    }
    
}


