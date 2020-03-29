//
//  LandingViewController.swift
//  CaptionThat
//
//  Created by Tiara Imani Logan on 2/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//
import Foundation 
import UIKit

class LandingViewController: UIViewController {


    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    func setupView() { //had no idea how this was supposed to be set up. Provided code referenced
        self.authorLabel.text = "ti-logan-tilogan@syr.edu"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleUserDidTapImageGallery(_ sender: UIButton) {
    }
    
    
}



extension LandingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func showImagePicker() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        pickerController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
    
           // Run everything in defer **last**
            defer { picker.dismiss(animated: true, completion: nil) }
            
            // Retrieve the image I selected
            guard let image = (info[.originalImage] ?? info[.editedImage]) as? UIImage else {
                assertionFailure("Failed to retrieve image after image picker told us an image was picked")
                       return
                   }
            // Create a Picture instance
        struct Picture(image: image) {}
        
  
    }
    
    
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                // Do nothing. We have nothing to handle here. Dismiss the picker
                picker.dismiss(animated: true, completion: nil)
            
            }

        
    

        
    
}

