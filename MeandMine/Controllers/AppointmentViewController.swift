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
import Firebase
import CodableFirebase


class AppointmentViewController: UIViewController {
    //MARK: Properties
    var datePicker = UIDatePicker()
    // var doctor: Doctor?
    var appointment: Appointment?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var appointmentTitle: UITextField!
    @IBOutlet weak var appointmentAddOne: UITextField!
    @IBOutlet weak var appointmentAddTwo: UITextField!
    @IBOutlet weak var appointmentCity: UITextField!
    @IBOutlet weak var appointmentState: UITextField!
    @IBOutlet weak var appointmentZipcode: UITextField!
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDate()
        
  
        guard let currentUser = Auth.auth().currentUser?.uid
            else {
                print("Couldn't find user")
                return
        }
        
        let basicQuery = Firestore.firestore().collection("Appointment").whereField("uid",isEqualTo: currentUser)
        basicQuery.getDocuments { (snapshot, error) in
            if let error = error {
                print("Oh no! Got an error! \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else { return }
            let allDocuments = snapshot.documents
            for restaurantDocument in allDocuments {
                print("I have this restaurant \(restaurantDocument.data())")
            }
        }
        
    }

 
}

struct Appointment {
    var apptTitle: String!
    var apptAddOne: String!
    var apptAddTwo: String!
    var apptCity: String!
    var apptState: String!
    var apptZipcode: Int!
}

