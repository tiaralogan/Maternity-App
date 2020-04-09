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
   
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
   
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
    
    
    
    
    

        
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        let strDate = dateFormatter.string(from: datePicker.date)
            
            print (strDate)
        dateLabel.text = strDate
        
       
        
    }
    
   
    
    func setDate(_: Date, animated: Bool) {
        
        print (Date())
        
        
    }
    
    /*:@IBAction func datePickerAction(_ sender: Any) {
    
        let dateFormatter = DateFormatter()

    dateFormatter.dateStyle = DateFormatter.Style.short
    dateFormatter.timeStyle = DateFormatter.Style.short

    let strDate = dateFormatter.string(from: datePicker.date)
        
        print (strDate)
    dateLabel.text = strDate
    
    
    
    
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
  //  print(datePicker)
}


struct ContentView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var birthDate = Date()

    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }

            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}
