//
//  LogInViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 2/19/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
//Mark Properties
//    @IBOutlet weak var MineAndMineLabel: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   

override func viewDidLoad(){
    super.viewDidLoad()
    }
    
    func login(){
       guard let email = email.text else {
            print("There is an issue")
            return
        }
        guard let password = password.text else {
            print("There is an issue")
            return
        }
        // Sign in user with an email and a password
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult,error in guard self != nil else {return}
       
    }

}
}
