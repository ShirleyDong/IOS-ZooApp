//
//  AnimalViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {
    //outlet of the interface
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBAction func detailAction(_ sender: Any) {
        
    }
    
    
    var animalData: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Animal"
        
        //get the animal data from XML
        animalNameLabel.text = animalData.animalName
        animalImageView.image = UIImage(named: animalData.image)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"
        {
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destination as! DetailViewController
        // Pass the selected object to the new view controller.
        destination.animalData = animalData
        }
        
        if segue.identifier == "showMap"
        {
            // Get the new view controller using segue.destinationViewController.
            let destination = segue.destination as! MapViewController
            // Pass the selected object to the new view controller.
            destination.animalData = animalData
        }
        
    
    }
 

}
