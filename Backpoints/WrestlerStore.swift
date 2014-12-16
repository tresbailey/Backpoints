//
//  WrestlerStore.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/10/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit


class WrestlerStore: NSObject {
    
    var allWrestlers: [Wrestler]
    
    init(allWrestlers: [Wrestler]) {
        self.allWrestlers = allWrestlers
    }
    
    func createWrestler() -> Wrestler {
        let uid = NSUUID()
        
        let newWrestler = Wrestler(id: uid.UUIDString,
            firstName: "", lastName: "",
            qualifiedWeight: nil, normalWeight: nil,
            wins: 0, losses: 0)
        
        allWrestlers.append(newWrestler)
        
        return newWrestler
    }
    
    func removeWrestler(wrestler: Wrestler) -> Wrestler? {
        if let index = find(allWrestlers, wrestler) {
            return allWrestlers.removeAtIndex(index)
        }
        return nil
    }
    
    func moveWrestlerAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return;
        }
        
        // Get pointer to object being moved so you can re-insert it
        let movedItem = allWrestlers[fromIndex]
        
        // Remove item from array
        allWrestlers.removeAtIndex(fromIndex)
        
        // Insert item in array at new location
        allWrestlers.insert(movedItem, atIndex: toIndex)
    }
}