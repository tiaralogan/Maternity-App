//
//  UserProfile.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 4/12/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

struct UserProfile:Codable{
    var email: String
    var username: String
    var phone: Int
    var password: String
    
    
    
    
    init(username: String,
         email: String,
         password: String,
         phone: Int
        ) {
        self.username = username
        self.email = email
        self.phone = phone
        self.password = password
    }
    
    var documentData: [String: Any] {
           
           var uid = ""
           if let currentUser = Auth.auth().currentUser?.uid {
               uid = currentUser
           }
               
           return [
               "username": username,
               "email": email,
               "password": password,
               "phone": phone,
               "uid" : uid,
           ]
       }
    
}
