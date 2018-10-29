//
//  XMLDataParser.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit
import Foundation

class XMLDataParser: NSObject, XMLParserDelegate{
    //name
    var name: String
    init(name:String){self.name = name}
    
    //te variable want to use
    var cateName, cateImage: String!
    var sName, sLocation, sDescription, sImage, sURL, sLatitude, sLongitude: String!
    
    var passElementId : Int = -1
    var passData: Bool = false// secifiy if the tag is founf in XML
    
    //get the categery obj
    var menu = [Category]()
    
    //to get the animal obj
    var categery = [Animal]()
    
    var parser = XMLParser()
    
    let tags = ["categeryName", "thumbnail", "name", "location", "description", "image", "url", "latitude", "longitude"]
    
    //parsing functions
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // reset the spy vars for tags
        if tags.contains(elementName){
            // reset spies
            passElementId = tags.index(of: elementName)!
            passData = true
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if tags.contains(elementName){
        //reset the spy for new pull
        passElementId = -1
        passData = false
        }
        
        //test the categery exit
        if elementName == "animal"{
            //make a new categery and add to the menu
            let c = Category(categeryName: cateName, thumbnail:cateImage)
            menu.append(c)
            
        }
        
        //test the animal exit
        if elementName == "single"{
            //make a new animal and add to the categery
            let s = Animal(rName: cateName, animalName: sName, location: sLocation, description: sDescription, image: sImage, url: sURL, latitude: sLatitude, longitude: sLongitude )
            categery.append(s)
            
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //found string where to place it
        if passData{
            switch passElementId {
            case 0 : cateName = string
            case 1 : cateImage = string
            case 2 : sName = string
            case 3 : sLocation = string
            case 4 : sDescription = string
            case 5 : sImage = string
            case 6 : sURL = string
            case 7 : sLatitude = string
            case 8 : sLongitude = string
            default : break
            }
            
        }
    }
    
    func beginParsing()
    {
        // find the file path
        let bundleURL = Bundle.main.bundleURL
        let fileURL = URL(string: self.name, relativeTo: bundleURL)
        
        parser = XMLParser(contentsOf: fileURL!)!
        
        // set the delegate and parse
        parser.delegate = self
        parser.parse()
    }
    
    
    
    
    
    
    
}
