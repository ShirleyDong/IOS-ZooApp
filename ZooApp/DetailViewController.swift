//
//  DetailViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 28/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //the outlet of the detail view
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailDescriptionField: UITextView!
    
    @IBAction func webAction(_ sender: Any) {
        
    }
    var animalData: Animal!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //add data to the view
        self.title = "Detail"
        detailImageView.image = UIImage(named: animalData.image)
        detailNameLabel.text = animalData.animalName
        detailDescriptionField.text = animalData.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeb"
        {
            // Get the new view controller using segue.destinationViewController.
            let destination = segue.destination as! WebViewController
            // Pass the selected object to the new view controller.
            destination.animalData = animalData
        }
        
        
    }
    

}
