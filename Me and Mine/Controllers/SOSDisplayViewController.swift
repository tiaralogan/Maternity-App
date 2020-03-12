//
//  SOSPageViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 2/19/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit

class SOSDisplayViewController: UIViewController {
//MARK: Properties
    
    @IBOutlet weak var DocName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var emergencynum: UILabel!
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var cityInfo: UILabel!
    @IBOutlet weak var stateInfo: UILabel!
    @IBOutlet weak var zipInfo: UILabel!
    //MARK: Actions
    
    @IBAction func EditInfo(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
