//
//  ContactsTableViewController.swift
//  ContactsTableView
//
//  Created by Eduardo Vital Alencar Cunha on 16/05/17.
//  Copyright © 2017 Vital. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    var contactsArray: NSArray = []
    var contactsDictionary: NSDictionary = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Retrieving data from playlist
        let path = Bundle.main.path(forResource: "contacts", ofType: "plist")!

        self.contactsArray = NSArray(contentsOfFile: path)!
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
        return contactsArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? CustomTableViewCell)!

        // Configure the cell...
        self.contactsDictionary = contactsArray[indexPath.row] as! NSDictionary

        let name = self.contactsDictionary["firstName"]
        let lastName = self.contactsDictionary["lastName"]
        let rawImage = self.contactsDictionary["imageName"]

        cell.nameLabel.text = name as? String
        cell.lastName.text = lastName as? String

        let image = UIImage(named: rawImage as! String)

        cell.photoImage.image = image
        //cell.backgroundView = contactsArray[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactViewController = storyboard.instantiateViewController(withIdentifier: "detailContact") as! ContactDetailTableViewController

        contactViewController.contact = contactsArray[indexPath.row] as! NSDictionary
        navigationController?.pushViewController(contactViewController, animated: true)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
