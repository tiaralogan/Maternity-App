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


struct Doctor {
    var name: String
    var email: String
    var city: String
    var address: String
    var number: Int
    var zipcode: Int
    var state: String
    var documentID: String
    
    
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
        self.documentID = documentID
    }
    
    
    private init?(documentID: String, dictionary: [String: Any]) {
        
        print(dictionary.keys)
        //inbound Doctor
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let city = dictionary["city"] as? String,
            let address = dictionary["address"] as? String,
            let state = dictionary["state"] as? String,
            let zipcode = dictionary["state"] as? Int,
            let number = dictionary["number"] as? Int  else {
                return nil
        }
        
        self.init(name: name,
                  email: email,
                  city: city,
                  address: address,
                  number: number,
                  zipcode: zipcode,
                  state: state,
                  documentID: documentID)
    }
    
    init(name: String,
         email: String,
         city: String,
         address: String,
         number: Int,
         zipcode: Int,
         state: String) {
        
        let document = Firestore.firestore().collection("Doctor").document()
        // creating a new Doctor
        self.init(name: name,
                  email: email,
                  city: city,
                  address: address,
                  number: number,
                  zipcode: zipcode,
                  state: state,
                  documentID: document.documentID)
        
    }
    
    
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else {
            return nil
        }
        self.init(documentID: document.documentID, dictionary: data)
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



