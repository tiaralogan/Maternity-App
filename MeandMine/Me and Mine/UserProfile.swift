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

struct UserProfile: Codable{
    var email: String
    var username: String
    var firstName: String
    var lastName: String
    
    
    
    
    init(username: String,
         email: String,
         firstName: String,
         lastName: String) {
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var documentData: [String: Any] {
           
           var uid = ""
           if let currentUser = Auth.auth().currentUser?.uid {
               uid = currentUser
           }
               
           return [
               "username": username,
               "email": email,
               "firstName": firstName,
               "lastName": lastName,
               "uid" : uid,
           ]
       }
    
}
