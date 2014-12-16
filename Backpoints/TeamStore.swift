//
//  TeamStore.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/11/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class TeamStore: NSObject {
 
    var allTeams: [Team] = []
    
    func createTeam() -> Team {
        let uid = NSUUID()
        
        let grouping = Grouping(id: NSUUID().UUIDString, name: "", members: [], memberOf: nil)
        let newTeam = Team(id: uid.UUIDString, name: "", memberOf: grouping, wrestlers: [])
        
        
        allTeams.append(newTeam)
        
        return newTeam
    }
    
    func removeTeam(team: Team) -> Team?  {
        if let index = find(allTeams, team) {
            return allTeams.removeAtIndex(index)
        }
        return nil
    }
    
    func moveTeamAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allTeams[fromIndex]
        
        allTeams.removeAtIndex(fromIndex)
        
        allTeams.insert(movedItem, atIndex: toIndex)
    }
}
