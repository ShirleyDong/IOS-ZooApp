//
//  MapViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 28/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    //outlet of the mapView
    @IBOutlet weak var mapView: MKMapView!
    
    var animalData: Animal!
    
    @IBAction func getDirections(_ sender: Any) {
        let latitude: CLLocationDegrees = Double(animalData.longitude)!
        let longitude: CLLocationDegrees = Double(animalData.latitude)!
        
        let regionDistance: CLLocationDistance = 1000;
        let coordiinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordiinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordiinates)
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = animalData.animalName
        
        mapItem.openInMaps(launchOptions: options)
    }
    
    var pin:LocationAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Map Of The Animal"
        
        mapView.delegate = self
        
        // Do any additional setup after loading the view.
        let latitude: CLLocationDegrees = Double(animalData.longitude)!
        let longitude: CLLocationDegrees = Double(animalData.latitude)!
        let coordinate = CLLocationCoordinate2D(latitude:latitude, longitude:longitude)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
        
        //pen
        pin = LocationAnnotation(mName: animalData.animalName, mLocation: animalData.location, coordinate: coordinate)
        mapView.addAnnotation(pin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier:animalData.animalName)
        annotationView.image = UIImage(named: animalData.image)
        let transform = CGAffineTransform(scaleX:0.2, y:0.2)
        annotationView.transform = transform
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
