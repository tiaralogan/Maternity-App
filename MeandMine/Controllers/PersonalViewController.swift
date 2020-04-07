//
//  PersonalViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit
import Foundation
import EventKit
import FirebaseAuth
import SwiftUI




class PersonalViewController: UIViewController {
    
    
    //MARK: Properties
    
  
    @IBOutlet weak var countDownLabel: UILabel!
    
    
 
    
    
}








struct PersonalViewController2: View{
    var toDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    var body: some View {
        VStack {
            Text("Countdown")
            Spacer().frame(height:50)
            TimerView(setDate: toDate)
        }.font(.system(size:30))
    }
}

struct PersonalViewControler_Preview: PreviewProvider{
    static var previews: some View{
        PersonalViewController2()
    }
}

struct TimerView: View {
    @State var nowDate: Date = Date()
    let setDate: Date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in self.nowDate = Date()}
    }
    
    var body: some View {
        Text(TimerFunction(from: setDate))
            .onAppear(perform: {self.timer})
    }
    
    func TimerFunction(from date: Date)-> String {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar.dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
        return String(format: "%02d remaining - %02d:%02d:%2d", timeValue.day!, timeValue.hour!, timeValue.minute!, timeValue.second!)
    }
}






/*: protocol UIPickerViewDataSource: class {
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}


class PersonalViewController: UIViewController, UIPickerViewDelegate{
    
    //Step 1: Get the username from the user profile in create account to display in the section that says USERNAME -- might need to use realtime database to store the user profile in and to fetch it
    @IBOutlet weak var avatarName: UILabel!
    
    //Step 2: Add the countdown to the personal page so mother is able to add the countdown to the baby's arrival
    
    //Step3: Add a section where the user can say whether they are having a baby girl, a baby boy, or its a surprise and they don't know
    @IBOutlet weak var babyGender: UITextField!
    var dataObject: [String] = ["Baby Girl","Baby Boy", "A Surprise"]
    
    @IBOutlet weak var arrivalTitle: UIStackView!
    @IBOutlet weak var countdownLabel: UIStackView!
    var dataSource: UIPickerViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Step3: Add a section where the user can say whether they are having a baby girl, a baby boy, or its a surprise and they don't know
        let picker = UIPickerView()
        picker.delegate = self
        self.babyGender.inputView = picker
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.dataObject.count;
        }
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
        {
            return self.dataObject[row];
        }
        
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
        {
            self.babyGender.text = self.dataObject[row];
            self.babyGender.endEditing(true)
        }
        //Step5: Add a swipe gesture so the personal page can swipe from the appointments page and the planning page
     
    }
    //Step5: Add a swipe gesture so the personal page can swipe from the appointments page and the planning page
    
    @IBAction func swipeToPlanning(_ gestureRecognizer: UISwipeGestureRecognizer) {
    if gestureRecognizer.state == .ended { //Perform Action}
    }
    }
    // Step4: Add a reminder section to help remind the user to do things
    
    
}// END OF CLASS
*/
