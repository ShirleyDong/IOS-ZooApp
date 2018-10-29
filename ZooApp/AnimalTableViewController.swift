//
//  AnimalTableViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit

class AnimalTableViewController:

    UITableViewController {
   
    
    
    //table data
    @objc var categeryName1: String!
    var categeryData : Category!
    var animalData = [Animal]()
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the animal data to the categery data
        categeryData = Category(fromXML: "animal.xml")
        for i in 0 ..< categeryData.getCount() {
            if categeryName1 == categeryData.data[i].rName{
                animalData.append(categeryData.data[i])
            }
        }
        //set the title
        self.title = "Animal List"
        self.tableView.rowHeight = 50
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)

        // Configure the cell...
        let animal = animalData[indexPath.row]
        cell.textLabel?.text = animal.animalName
        cell.imageView?.image = UIImage(named: animal.image)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "animal"{
            
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            
            // Get the new view controller using segue.destinationViewController.
            let destination = segue.destination as! AnimalViewController
            
            // Pass the selected object to the new view controller.
            destination.animalData = animalData[(indexPath?.row)!]
            
            
        }
        
    }


}
