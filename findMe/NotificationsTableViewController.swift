//
//  NotificationsTableViewController.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class NotificationsTableViewController: UITableViewController {

    // MARK: Properties
    
    var notifications = [Notification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Do any additional setup after loading the view.
        let image = UIImage(named: "defaultImage")
        let pet = Pet(name: "Lucy", description: "Es buenita", picture: image)
        let userOwner = User(name: "Adriana", lastname: "Fernandez", pet: pet, phoneNumber: "123123123")
        let userFound = User(name: "Mauro", lastname: "Benavidez", pet: pet, phoneNumber: "987987987")
        let notification = Notification(userDogOwner: userOwner, userFoundDog: userFound, latitude: 123, longitude: 123, date: Date.init())

        notifications += [notification]
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
        return notifications.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier =  "NotificationTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotificationTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NotificationTableViewCell.")
        }
        
        let notification = notifications[indexPath.row]
        cell.petNameLabel.text = notification.userDogOwner.pet.name
        cell.petPictureImageView.image = notification.userDogOwner.pet.picture
        
        
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

    
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let notificationViewController = segue.destination as? NotificationViewController
            else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
        
        guard let selectedMeal = sender as? NotificationTableViewCell else{
            fatalError("Unexpected sender: \(String(describing: sender))")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedMeal) else{
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedNotification = notifications[indexPath.row]
        
        notificationViewController.notification = selectedNotification
    }
    
    //Mark: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? NotificationViewController,
            let notification = sourceViewController.notification {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                notifications[selectedIndexPath.row] = notification
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else{
                // Add a new meal.
                let newIndexPath = IndexPath(row: notifications.count, section: 0)
                
                notifications.append(notification)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    

}
