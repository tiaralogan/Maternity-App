//
//  PersonalViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Foundation
import EventKit

protocol UIPickerViewDataSource: class {
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}

class PersonalViewController: UIViewController, UIPickerViewDelegate{
    
    //Step 1: Add the countdown to the personal page so mother is able to add the countdown to the baby's arrival
    @IBOutlet weak var avatarName: UILabel!
    @IBOutlet weak var babyGender: UITextField!
    var dataObject: [String] = ["Baby Girl","Baby Boy", "A Surprise"]
    
    @IBOutlet weak var arrivalTitle: UIStackView!
    @IBOutlet weak var countdownLabel: UIStackView!
    var dataSource: UIPickerViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = UIPickerView()
        picker.delegate = self
        self.babyGender.inputView = picker
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.dataObject.count;
        }
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
        {
            return self.dataObject[row];
        }
        
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            self.babyGender.text = self.dataObject[row];
            self.babyGender.endEditing(true)
        }
    }
    // Step3: Add a reminder section to help remind the user to do things
    
}// END OF CLASS
