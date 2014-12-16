//
//  Grouping.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/11/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class Grouping: NSObject, Grouper, Grouped {
    var id: String
    var name: String
    var members: [Grouped]
    var memberOf: Grouper?
    
    init(id: String, name: String, members: [Grouped], memberOf: Grouper?) {
        self.id = id
        self.name = name
        self.members = members
        self.memberOf = memberOf
        super.init()
    }
    
    func getOwner() -> Grouper? {
        return memberOf
    }
    
    func getMembers() -> [Grouped] {
        return members
    }
  
}
