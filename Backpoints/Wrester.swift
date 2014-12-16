//
//  Wrester.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/10/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class Wrestler: NSObject, NSCoding {
    var id: String
    var firstName: String {
        didSet {
            self.name = "\(self.firstName) \(self.lastName)"
        }
    }
    var lastName: String {
        didSet {
            self.name = "\(self.firstName) \(self.lastName)"
        }
    }
    var name: String
    var qualifiedWeight: Int?
    var normalWeight: Int?
    var wins: Int = 0
    var losses: Int = 0
    
    init(id: String, firstName: String, lastName: String, qualifiedWeight: Int?, normalWeight: Int?, wins: Int, losses: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.name = "\(self.firstName) \(self.lastName)"
        self.qualifiedWeight = qualifiedWeight
        self.normalWeight = normalWeight
        self.wins = wins
        self.losses = losses
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        
        id = aDecoder.decodeObjectForKey("id") as String
        firstName = aDecoder.decodeObjectForKey("firstName") as String
        lastName = aDecoder.decodeObjectForKey("lastName") as String
        qualifiedWeight = aDecoder.decodeIntegerForKey("qualifiedWeight")
        normalWeight = aDecoder.decodeIntegerForKey("normalWeight")
        wins = aDecoder.decodeIntegerForKey("wins")
        losses = aDecoder.decodeIntegerForKey("losses")
        self.name = "\(self.firstName) \(self.lastName)"
        super.init()
    }
    
    /*
    Encodes the object for serialization
    */
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(wins, forKey: "wins")
        aCoder.encodeObject(losses, forKey: "losses")
        if let qualifiedWeight = qualifiedWeight {
            aCoder.encodeInteger(qualifiedWeight, forKey: "qualifiedWeight")
        }
        if let normalWeight = normalWeight {
            aCoder.encodeInteger(normalWeight, forKey: "normalWeight")
        }
        
    }
}