//
//  EditSOSViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase


class EditSOSViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var sosLabel: UILabel!
    @IBOutlet weak var docName: UITextField!
    @IBOutlet weak var docEmail: UITextField!
    @IBOutlet weak var docEmerNum: UITextField!
    @IBOutlet weak var docAddress: UITextField!
    @IBOutlet weak var docCity: UITextField!
    @IBOutlet weak var docState: UITextField!
    @IBOutlet weak var docZip: UITextField!
    
    
    var doctor: Doctor?
    
    @IBAction func EnterButton(_ sender: Any) {
//<<<<<<< ConnectToDataBases
        // 1. Save to database. call complete
        
    
        // 2. Pop View Controller
      //  self.navigationController?.popViewController(animated: true)
        //dont need
        
        self.dismiss(animated: true, completion: nil)
      
//=======
        //1.Save to database - call complete
        
        //2. Pop View Controller
        self.dismiss(animated: true, completion: nil)
//>>>>>>> master
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
   
    //This should be able to fetch the data from the Database once the user writes info
    //this is creating the reference to the root of the database structure
        guard let currentUser = Auth.auth().currentUser?.uid
            else {
                print("Couldn't find user")
                return
        }
        
        let basicQuery = Firestore.firestore().collection("Doctor").whereField("uid",isEqualTo: currentUser)
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
    
    
    
    
    
    
    
    
    //This should be able to fetch the data from the Database once the user writes info
    //this is creating the reference to the root of the database structure
 /*   let ref = Database.database().reference(withPath: "usersProfile")
    //this is making a reference to the child node
    lazy var doctorRef = ref.child("Doctor")
    //this is allowing the code to fetch the data from the Database
    lazy var refHandle = ref.observe(DataEventType.value, with: {snapshot in
        //
        print(snapshot.value as Any)
    })*/
    
    // This is to see if it has been completed or not -- if the data has been saved
 /*   lazy var complete = ref.child("usersProfile").child("Doctor").setValue(["docName": docName]) {
        (error:Error?, ref:DatabaseReference) in
        if let error = error {
            print("Data could not be saved: \(error).")
        } else {
            print("Data saved successfully!")
        }
     }*/
    
    
    
}
