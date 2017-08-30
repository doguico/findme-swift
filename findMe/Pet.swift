//
//  Pet.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class Pet{
    
    // MARK: Properties
    
    var name: String
    var description: String
    var picture: UIImage?
    
    init(name: String, description: String, picture: UIImage?){
        self.name = name
        self.description = description
        self.picture = picture
    }
    
}
