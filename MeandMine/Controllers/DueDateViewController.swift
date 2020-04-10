//
//  DueDateViewController.swift
//  Me and Mine
//
//  Created by Tiara Imani Logan on 4/9/20.
//  Copyright © 2020 Logan. All rights reserved.
//


import Foundation
import UIKit
import SwiftUI

class DueDateViewController: UIViewController {
    //MARK: Properties
    var datePicker = UIDatePicker()
   
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var countDown: UILabel!
    @IBAction func dueDatePicker(_ sender: UIDatePicker) {
    
    
    let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: sender.date)
        dateLabel.text = strDate
    }
    
   
    func setInitialDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
        
        
    //   let result = countDownString(from: Date(),until: nowDate)
     //  countDown.text = result
        
    }
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDate()
    }
    
    
    
   
    
    
    
 
}
