//
//  AppointmentViewController.swift
//  Me and Mine
//
//  Created by Tiara Imani Logan on 4/9/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class AppointmentViewController: UIViewController {
    //MARK: Properties
    var datePicker = UIDatePicker()
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: sender.date)
        dateLabel.text = strDate
    }
    
   
 
    func setInitialDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: datePicker.date)
        dateLabel.text = strDate
        
    }
    
    
    func setScrollView () {
   //     scrollView.bottom =  safeA + 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDate()
       // setScrollView()
    }
    
    
 
}


