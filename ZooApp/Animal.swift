//
//  Animal.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import Foundation

class Animal {
    
    
    //var of the single animals
    var rName: String = ""
    var animalName : String = ""
    var location: String = ""
    var description: String = ""
    var image: String = ""
    var url: String = ""
    var latitude: String = ""
    var longitude: String = ""
    
    init(rName: String, animalName: String, location: String, description: String, image: String, url: String, latitude: String, longitude: String ) {
        self.rName = rName
        self.animalName = animalName
        self.location = location
        self.description = description
        self.image = image
        self.url = url
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
