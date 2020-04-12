//
//  Doctor.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 4/7/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase


struct Doctor: Codable {
    var name: String
    var email: String
    var city: String
    var address: String
    var number: Int
    var zipcode: Int
    var state: String
    
    
    
    init(name: String,
         email: String,
         city: String,
         address: String,
         number: Int,
         zipcode: Int,
         state: String,
         documentID: String) {
        self.name = name
        self.email = email
        self.city = city
        self.address = address
        self.number = number
        self.zipcode = zipcode
        self.state = state
       
    }
    
    init(name: String,
         email: String,
         city: String,
         address: String,
         number: Int,
         zipcode: Int,
         state: String) {
    
        // creating a new Doctor
        self.init(name: name,
                  email: email,
                  city: city,
                  address: address,
                  number: number,
                  zipcode: zipcode,
                  state: state)
        
    }
    
    /// The dictionary representation of the restaurant for uploading to Firestore.
    var documentData: [String: Any] {
        
        var uid = ""
        if let currentUser = Auth.auth().currentUser?.uid {
            uid = currentUser
        }
            
        return [
            "name": name,
            "email": email,
            "city": city,
            "address": address,
            "number": number,
            "zipcode": zipcode,
            "state": state,
            "uid" : uid,
        ]
    }
}

