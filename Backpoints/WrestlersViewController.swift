//
//  WrestlersViewController.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/10/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class WrestlersViewController: UITableViewController {
    
    let wrestlerStore: WrestlerStore
    let team: Team
    
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
        // Create a Details View Controller
        let wdvc = WrestlerDetailViewController(wrestlerStore: wrestlerStore)
        
        // Give the detail view controller the selected wrestler
        let wrestler = wrestlerStore.allWrestlers[indexPath.row]
        wdvc.wrestler = wrestler
        
        // Push it onto the navigation controller's stack
        showViewController(wdvc, sender: self)
    }
    
    /*
    Called when a row is dropped in reorder
    */
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        // Update the model
        wrestlerStore.moveWrestlerAtIndex(sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
    /*
    Called when editing is complete on the table
    */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // If the table view is asking to commit a delete command
        if editingStyle == .Delete {
            let wrestler = wrestlerStore.allWrestlers[indexPath.row]
            // Remove the wrestler
            wrestlerStore.removeWrestler(wrestler)
            
            // Also remove that row from the table view with an animation
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
            
    }

    /*
    Called when a +/New button is tapped
    */
    @IBAction func addNewWrestler(sender: AnyObject) {
        // Make a new index path for the 0th section, last row
        let newWrestler = wrestlerStore.createWrestler()
        
        if let index = find(wrestlerStore.allWrestlers, newWrestler) {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            // Insert this new row into the table
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Top)
        }
        
    }
    
    /*
    Called after the view has loaded the first time
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the NIB file
        let nib = UINib(nibName: "WrestlerCell", bundle: nil)
        // Register this NIB, which contains the cell
        tableView.registerNib(nib, forCellReuseIdentifier: "WrestlerCell")
    }
    
    /*
    Setup table view with number of rows
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wrestlerStore.allWrestlers.count
    }
    
    /*
    Draws each cell of the table
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create an instance of UITAbleViewCell, with default appearance
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("WrestlerCell", forIndexPath: indexPath) as WrestlerCell
        
        let item = wrestlerStore.allWrestlers[indexPath.row]
        
        // Configure the cell with the Wrestler
        cell.nameLabel.text = item.name
        cell.normalWeightLabel.text = "\(item.normalWeight)"
        cell.winsLabel.text = "\(item.wins)"
        cell.lossesLabel.text = "\(item.losses)"
        
        return cell
    }
    
    /* 
    Constructor for the store
    */
    init(team: Team, wrestlerStore: WrestlerStore?) {
        self.team = team
        self.wrestlerStore = wrestlerStore ?? WrestlerStore(allWrestlers: team.wrestlers)
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "BackPoints Team"
        
        // Create a new bar button item that will send
        // addNewWreestler to this object
        let addWrestler = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewWrestler:")
        
        // Set this bar button item as the right item in the navigationItem
        navigationItem.rightBarButtonItem = addWrestler
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }
    
    /*
    Required constructor
    */
    required init(coder aDecoder: NSCoder) {
        fatalError("Not Implemented")
    }
   
}
