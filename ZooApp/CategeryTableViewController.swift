//
//  CategeryTableViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 27/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit

class CategeryTableViewController: UITableViewController {
    
    //categery data
    var categeryData: Menu!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //make the data and set title
        categeryData = Menu(fromXML: "animal.xml")
        
        self.title = "categery"
        
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
        return categeryData.getCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "categeryCell", for: indexPath)
        
        let categery = categeryData.getCategery(id: indexPath.row)
        cell.textLabel?.text = categery.categeryName
        cell.imageView?.image = UIImage(named: categery.thumbnail)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ /Users/td11/Desktop/ZooApp/ZooApptableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get the indexPath for cell
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
        // Get the new view controller using segue.destinationViewController.
        let destination = segue.destination as! AnimalTableViewController
        
        // Pass the selected object data to the new view controller.
        destination.categeryName1 = categeryData.getCategery(id: (indexPath?.row)!).categeryName
    }

}
