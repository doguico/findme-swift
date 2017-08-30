//
//  User.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation

class User{
    
    // MARK: Properties
    var name: String
    var lastname: String
    var pet: Pet
    var phoneNumber: String
    
    init(name: String, lastname: String, pet: Pet, phoneNumber: String){
        self.name = name
        self.lastname = lastname
        self.pet = pet
        self.phoneNumber = phoneNumber
    }
}
