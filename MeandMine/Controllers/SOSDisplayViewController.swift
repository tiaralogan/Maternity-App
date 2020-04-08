//
//  SOSPageViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 2/19/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class SOSDisplayViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var sosLabel: UILabel!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docEmail: UILabel!
    @IBOutlet weak var docEmerNum: UILabel!
    @IBOutlet weak var docAddress: UILabel!
    @IBOutlet weak var docCity: UILabel!
    @IBOutlet weak var docState: UILabel!
    @IBOutlet weak var docZip: UILabel!
    
    var doctor: Doctor?
    
    
    @IBAction func EditButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDocInfo()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let doctor = self.doctor else { return }
        fetchDocInfo()
    }
    
    func fetchDocInfo() {
        
        // Fetch the Doctor Information and map to `Doctor.swift`
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
            guard let doctorInfo = snapshot.documents.first else {
                print("no doctor found in db.")
                return
            }
            let doctor  = try! FirestoreDecoder().decode(Doctor.self, from: doctorInfo.data())
            print("My doctor: \(doctor.name)")
            self.doctor = doctor
            self.updateDisplayWithDoctor(doctor: doctor)
        }
    }
    
    // 1.
    func updateDisplayWithDoctor(doctor: Doctor)  {
        
        // all text fields
        docName.text = doctor.name
    }
    
    
    // 2. In your prepare segue, pass the self.doctor to your destination controller (EditSOSViewCOntroller)
    
    
    
    
} //END OF CLASS
