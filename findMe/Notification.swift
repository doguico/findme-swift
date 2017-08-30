//
//  Notification.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation

class Notification{
    
    // MARK: Properties
    
    var userDogOwner: User
    var userFoundDog: User
    var latitude: Int
    var longitude: Int
    var date: Date
    
    init(userDogOwner: User, userFoundDog: User, latitude: Int, longitude: Int, date: Date){
        self.userDogOwner = userDogOwner
        self.userFoundDog = userFoundDog
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
    }
    
}
