//
//  Categery.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import Foundation


struct Category
{
    //details odf the Categery
    var data : [Animal] = []
    
    init(fromXML: String) {
        //make a parser of animal data and begin to parser
        let parser = XMLDataParser(name: fromXML)
        parser.beginParsing()
        
        //init data
        self.data = parser.categery
        
        
    }
    
    var categeryName: String = ""
    var thumbnail: String = ""
    
    init(categeryName: String, thumbnail: String) {
        self.categeryName = categeryName
        self.thumbnail = thumbnail
        
    }
    
    //get the nuber of the singer
    func getCount()->Int{
        return data.count
    }
    
    
}
