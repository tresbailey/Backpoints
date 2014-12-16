//
//  WrestlerDetailViewController.swift
//  Backpoints
//
//  Created by Tres Bailey on 12/10/14.
//  Copyright (c) 2014 TRESBACK. All rights reserved.
//

import UIKit

class WrestlerDetailViewController: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var qualifiedWeightField: UITextField!
    @IBOutlet weak var normalWeightField: UITextField!
    @IBOutlet weak var winsField: UITextField!
    @IBOutlet weak var lossesField: UITextField!
    
    var wrestlerStore: WrestlerStore
    var wrestler: Wrestler? {
        didSet {
            navigationItem.title = wrestler?.name
        }
    }
    
    /*
    Called before a view is unshown
    */
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first reponder
        view.endEditing(true)
        
        // Save  changes to wrestler
        wrestler?.firstName = firstNameField.text
        wrestler?.lastName = lastNameField.text
        wrestler?.qualifiedWeight = qualifiedWeightField.text.toInt()
        wrestler?.normalWeight = normalWeightField.text.toInt()
        wrestler?.wins = winsField.text.toInt() ?? 0
        wrestler?.losses = lossesField.text.toInt() ?? 0
    }
    
    /*
    Called before a view is shown
    */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.firstNameField.text = wrestler?.firstName
        self.lastNameField.text = wrestler?.lastName
        self.qualifiedWeightField.text = "\(wrestler?.qualifiedWeight)"
        self.normalWeightField.text = "\(wrestler?.normalWeight)"
        self.winsField.text = "\(wrestler?.wins)"
        self.lossesField.text = "\(wrestler?.losses)"
        
    }
    
    init(wrestlerStore: WrestlerStore) {
        self.wrestlerStore = wrestlerStore
        super.init(nibName: "WrestlerDetailViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Decoder init not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
