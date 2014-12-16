//
//  School.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/11/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class Team: NSObject, Grouped {
    
    var id: String
    var name: String
    var memberOf: Grouper?
    var wrestlers: [Wrestler] = []
    
    init(id: String, name: String, memberOf: Grouper, wrestlers: [Wrestler]) {
        self.id = id
        self.name = name
        self.memberOf = memberOf
        self.wrestlers = wrestlers
        super.init()
    }
    
    func getOwner() -> Grouper? {
        return memberOf
    }
    
}
