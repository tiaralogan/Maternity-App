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
  
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   
    

    // Step 1: Create an action from storyboard to this class
       // using a continue action button -- add only email and password and making sure to handle an error if needed
       // Step 2: In action call function login()
    @IBAction func ContinueButton(_ sender: Any) {
        guard let email = email.text else {
                   print("There is an issue")
                   return
               }
        guard let password = password.text else {
                   print("There is an issue")
                   return
               }
      
        
        // Sign in user with an email and a password
        Auth.auth().signIn(withEmail: "scheeks@gmail.com", password: "cheeks") {(user,error) in
            if error == nil{
                print("Login was successful")
                
                //AuthDataResult?.user.uid
                self.performSegue(withIdentifier: "goHome", sender: self)
                
                
                   }
            else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
    }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
   
}
