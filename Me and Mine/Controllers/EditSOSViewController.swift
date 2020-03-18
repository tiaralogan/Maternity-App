//
//  EditSOSViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase

class EditSOSViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var sosLabel: UILabel!
    @IBOutlet weak var docName: UITextField!
    @IBOutlet weak var docEmail: UITextField!
    @IBOutlet weak var docEmerNum: UITextField!
    @IBOutlet weak var docAddress: UITextField!
    @IBOutlet weak var docCity: UITextField!
    @IBOutlet weak var docState: UITextField!
    @IBOutlet weak var docZip: UITextField!
    
    //Step1: We want the user to be able to add their doctor's information -- might need to use realtime database to be able to store 
    
        
        
    
    //Step2: Once the user press enter, all the info is stored (in Firebase or realtime database with its user profile property) and the info is displayed in the SOSDisplayViewController.swift (can't be changed unless they press the edit info button again)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
