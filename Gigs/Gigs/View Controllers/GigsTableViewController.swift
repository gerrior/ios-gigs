//
//  GigsTableViewController.swift
//  Gigs
//
//  Created by Mark Gerrior on 3/11/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {

    // MARK: - Properties
    
    var gigController = GigController()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        // Show login view if conditions require
        if gigController.bearer == nil {
            performSegue(withIdentifier: "CredentialsSegue", sender: self)
            
            // TODO: fetch gigs here
        }

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //gigController.gigs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigCell", for: indexPath)

        cell.textLabel?.text = "foo"
        cell.detailTextLabel?.text = "Date Goes Here"
        // FIXME:
//        cell.detailTextLabel?.text = gigController.dateFormatter.string(from: Date)

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "CredentialsSegue" {
            // inject dependencies
            if let loginVC = segue.destination as? LoginViewController {
                loginVC.gigController = gigController
            }
        } else if segue.identifier == "AddGig" ||
            segue.identifier == "EditGig" {
            
            if let detailVC = segue.destination as? GigDetailViewController {
                detailVC.gigController = gigController
                detailVC.gig = nil
                
                if segue.identifier == "EditGig" {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        detailVC.gig = gigController.gigs[indexPath.row]
                    }
                }
            }
        }
    }
}
