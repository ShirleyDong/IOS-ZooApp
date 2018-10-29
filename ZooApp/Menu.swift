//
//  Menu.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import Foundation
class Menu {
    
    //get the data of the animal categery
    var data : [Category] = []
    
    init(fromXML:String){
        
        // make a XMLPeopleParser and begin parsing
        let parser = XMLDataParser(name: fromXML)
        parser.beginParsing()
        
        // init data
        self.data = parser.menu
        
    }
    
    // methods to get the categery of the animal
    func getCategery(id:Int)->Category{
        return data[id]
    }
    
    func getCount()->Int{
        return data.count
    }
}
