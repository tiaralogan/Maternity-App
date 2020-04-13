//
//  SettingViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 4/12/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase


class SettingViewController: UIViewController {
    /* Edit Setting Display -- we want the user to be able to update their userprofile if needed and it will update in the Firebase cloud firestore */
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userProfile: UserProfile?
    var documentReference: DocumentReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplayOfUser()
    }
    
    func updateDisplayOfUser(){
        guard let userProfile = userProfile else { return}
        username.text = userProfile.username
        email.text = userProfile.email
        phone.text = String(userProfile.phone)
        password.text = userProfile.password
    }
    
    @IBAction func DoneButton(_ sender: Any) {
        guard let username = username.text,
            let email = email.text,
            let password = password.text,
            let phone = Int(phone.text ?? "0") else {return }
        
        
        if let userProfile = userProfile, let documentReference = documentReference{
            
            let updatedUser = UserProfile( username:username,
                                           email:email,
                                           password: password,
                                           phone: phone )
            
            documentReference.updateData(updatedUser.documentData) { (error) in
                if let error = error {
                    print("Could not update user profile: \(error)")
                    
                } else {
                    print("updated user profile success!")
                }
                
                self.dismiss(animated: true, completion: nil)
            }
            
        } else {
            // creates a  new profile on the server
            let newUserProfile = UserProfile(username: username, email: email, password: password, phone:phone)
            Firestore.firestore().collection("UserProfile").addDocument(data: newUserProfile.documentData) { (error) in
                if let error = error {
                    print("Could not update user profile : \(error)")
                    
                } else {
                    print("Added user profile a success!")
                }
                
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /* Setting Display -- we want the user to be able to display their user profile once they have updated it */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchUserInfo()
        
    }
    func fetchUserInfo() {
        // Fetch the User Information and map to `UserProfile.swift`
        guard let currentUser = Auth.auth().currentUser?.uid
            else {
                print("Couldn't find user")
                return}
        
        let basicQuery = Firestore.firestore().collection("UserProfile").whereField("uid", isEqualTo: currentUser).limit(to:1)
        basicQuery.getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results \(error)")
                return
            }
            
            let models = snapshot.documents.map { (document)  -> UserProfile in
                
                let model = try! FirestoreDecoder().decode(UserProfile.self, from: document.data())
                return model
                
            }
            
            self.userProfile = models.first
            self.documentReference = snapshot.documents.first?.reference
            if let error = error {
                print("Oh no! Got an error! \(error.localizedDescription)")
                return
            }
            
            // make this thisis called on main thread
            DispatchQueue.main.async {
                self.updateDisplayOfUser()
            }
        }
    }
    
   
}





