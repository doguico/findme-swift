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
    let foundByYou = 0
    let foundByOthers = 1
    var currentSegmentedSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifications = loadFoundByYouNotifications()
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
        
        cell.petNameLabel.text = currentSegmentedSelectedIndex ==
            foundByYou ? "Has encontrado a \(notification.userDogOwner.pet.name)" :
                    "\(notification.userFoundDog.name) ha encontrado a \(notification.userDogOwner.pet.name)"
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
    
    // MARK: Private Methods
    
    func loadFoundByYouNotifications() -> [Notification]{
        
        let image = UIImage(named: "dog")
        let image1 = UIImage(named: "dog1")
        let image3 = UIImage(named: "dog3")
        let image4 = UIImage(named: "dog4")
        
        let pet = Pet(name: "Slash", description: "Escucha guns n roses", picture: image)
        let pet1 = Pet(name: "Flora", description: "Esta un poco ciega", picture: image1)
        let pet3 = Pet(name: "Joaquin", description: "Juega al futbol", picture: image3)
        let pet4 = Pet(name: "Lucas", description: "Tiene muchas pulgas", picture: image4)
        
        let user = User(name: "Guido", lastname: "Corazza", pet: pet, phoneNumber: "099999999")
        let user1 = User(name: "Felipe", lastname: "Fernandez", pet: pet1, phoneNumber: "099123123")
        let user3 = User(name: "Jonn", lastname: "Snow", pet: pet3, phoneNumber: "091845764")
        let user4 = User(name: "Marcelo", lastname: "Gallardo", pet: pet4, phoneNumber: "094892098")

        let notification1 = Notification(userDogOwner: user1, userFoundDog: user, latitude: 11500, longitude: 12300, date: Date.init())
        let notification2 = Notification(userDogOwner: user4, userFoundDog: user, latitude: 11000, longitude: 12333, date: Date.init())
        let notification3 = Notification(userDogOwner: user3, userFoundDog: user, latitude: 13131, longitude: 12120, date: Date.init())
        
        return [notification1, notification2, notification3]
        
        
    }

    func loadFoundByOthersNotifications() -> [Notification]{
        
        let image = UIImage(named: "dog")
        let image1 = UIImage(named: "dog1")
        let image2 = UIImage(named: "dog2")
        
        let pet = Pet(name: "Slash", description: "Escucha guns n roses", picture: image)
        let pet1 = Pet(name: "Flora", description: "Esta un poco ciega", picture: image1)
        let pet2 = Pet(name: "Rocco", description: "No come carne", picture: image2)
        
        let user = User(name: "Guido", lastname: "Corazza", pet: pet, phoneNumber: "099999999")
        let user1 = User(name: "Felipe", lastname: "Fernandez", pet: pet1, phoneNumber: "099123123")
        let user2 = User(name: "Mario", lastname: "Gutierrez", pet: pet2, phoneNumber: "098456678")
        
        let notification1 = Notification(userDogOwner: user, userFoundDog: user2, latitude: 11500, longitude: 12300, date: Date.init())
        let notification2 = Notification(userDogOwner: user, userFoundDog: user1, latitude: 11000, longitude: 12333, date: Date.init())
        let notification3 = Notification(userDogOwner: user, userFoundDog: user2, latitude: 13131, longitude: 12120, date: Date.init())
        
        return [notification1, notification2, notification3]
        
    }
    
    
    // MARK: Actions
    
    
    @IBAction func changeNotifications(_ sender: UISegmentedControl) {
        currentSegmentedSelectedIndex = sender.selectedSegmentIndex
        switch currentSegmentedSelectedIndex{
        case foundByYou:
            self.notifications = loadFoundByYouNotifications()
        case foundByOthers:
            self.notifications = loadFoundByOthersNotifications()
        default:
            break;
        }
        
        self.tableView.reloadData()
    }
    

}
