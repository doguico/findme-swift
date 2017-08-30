//
//  NotificationViewController.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var foundByLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var notification: Notification?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let image = UIImage(named: "defaultImage")
        let pet = Pet(name: "Lucy", description: "Es buenita", picture: image)
        let userOwner = User(name: "Adriana", lastname: "Fernandez", pet: pet, phoneNumber: "123123123")
        let userFound = User(name: "Mauro", lastname: "Benavidez", pet: pet, phoneNumber: "987987987")
        notification = Notification(userDogOwner: userOwner, userFoundDog: userFound, latitude: 123, longitude: 123, date: Date.init())
        
        self.petImageView.image = notification?.userDogOwner.pet.picture
        self.petNameLabel.text = notification?.userDogOwner.pet.name
        self.ownerLabel.text = notification?.userDogOwner.name
        self.foundByLabel.text = notification?.userFoundDog.name
        self.phoneNumberLabel.text = notification?.userFoundDog.phoneNumber
        self.descriptionLabel.text = notification?.userDogOwner.pet.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The NotificationViewController is not inside a navigation controller.")
        }
    }

}
