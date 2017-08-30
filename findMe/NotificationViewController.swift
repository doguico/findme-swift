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
