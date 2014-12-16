//
//  TeamsViewController.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/11/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class TeamsViewController: UITableViewController {
    
    let teamStore: TeamStore

    /*
    Called before table is shown
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    /*
    Called when a row is tapped
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let team = teamStore.allTeams[indexPath.row]

        let wvc = WrestlersViewController(team: team, wrestlerStore: nil)
        
        showViewController(wvc, sender: self)
    }
    
    /* Called when a row is dropped in reorder */
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        teamStore.moveTeamAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    /* Called when a + button is tapped to add a row */
    @IBAction func addNewTeam(sender: AnyObject) {
        let newTeam = teamStore.createTeam()
        
        if let index = find(teamStore.allTeams, newTeam) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        }
    }
    
    /* Called after the view has loaded for the first time */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TeamCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "TeamCell")
    }
    
    /* Setup table with number of rows */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamStore.allTeams.count
    }
    
    /* Draws each cell of the table */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeamCell", forIndexPath: indexPath) as TeamCell
        
        let item = teamStore.allTeams[indexPath.row]
        
        cell.nameLabel.text = item.name
        
        return cell
    }
    
    /* Constructor for the store */
    init(teamStore: TeamStore) {
        self.teamStore = teamStore
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "BackPoints Team"
        
        let addTeam = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewTeam:")
        
        navigationItem.rightBarButtonItem = addTeam
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    /* Required Constructor */
    required init(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
}
