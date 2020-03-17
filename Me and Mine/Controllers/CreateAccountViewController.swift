//
//  CreateAccountViewController.swift
//  Me and Mine
//
//  Created by Tiara Imani Logan on 2/17/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase


class CreateAccountViewController: UIViewController {
    //MARK: Properties
    @IBOutlet var CreateAccountLabel: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    //Confirm password
    /*
     function -- make sure password and confirm password is the same
     
     func confirmPassword() {
     
     return Bool (yes/true)
     }
     */
    
    
    
    
    
    
    @IBAction func SignUpButton(_ sender: Any) {
        if email.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                
                    //we want to connect the user uid from firebase to the user's first/last/username by using the changerequest function to do so 
                    
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.displayName = ("\(String(describing: self.firstName.text)) \(String(describing: self.lastName.text))")
                    changeRequest?.commitChanges(completion: nil)
                    self.dismiss(animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
        
        
        
        
        override func viewDidLoad(){
            super.viewDidLoad()
            
            //once the user clicks the continue button - should create a new user
            /*     Auth.auth().createUser(withEmail: "amayafinklea@gmail.com", password: "aubfjfu") { authResult, error in
             // ...
             }
             // Do any additional setup after loading the view.
             }
             */
        }
        
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         if (segue.identifier == "CreateAccountSegue") {
         
         }
         
         /*  Main.storyboard.identifier: CreateAccountSegue
         if segue.identifier == "CreateAccountSegue" {
         
         // email.text password.text */
         } */
        
        
}




