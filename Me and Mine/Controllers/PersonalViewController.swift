//
//  PersonalViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/18/20.
//  Copyright © 2020 Logan. All rights reserved.
//

import UIKit


class PersonalViewController: UIViewController   {
    //Step 1: Add the countdown to the personal page so mother is able to add the countdown to the baby's arrival
        //Step 2: Make sure the mother (user) can change the dates in the planning page (which they can use the swipe motion from the personal page)
     @IBOutlet weak var countdownLabel: UILabel!
     
        var seconds = 60
        var timer = Timer()
        var isTimerRunning = false
        var resumeTapped = false
        @IBOutlet weak var pauseButton: UIButton!
        @IBOutlet weak var startButton: UIButton!
        
    
    @IBOutlet weak var avatarName: UILabel!
    
    
        @IBAction func startButton(_ sender: UIButton) {
            if isTimerRunning == false {
                 runTimer()}
            self.startButton.isEnabled = false
        }
        func runTimer(){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(PersonalViewController.updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
            pauseButton.isEnabled = true
        }
        @IBAction func pauseButton(_ sender: UIButton) {
            if self.resumeTapped == false{
                timer.invalidate()
                self.resumeTapped = true
                self.pauseButton.setTitle("Resume", for:.normal)
            }else {
                runTimer()
                self.resumeTapped = false}
            self.pauseButton.setTitle("Pause", for: .normal)
    }
        
        @IBAction func resetButton(_ sender: Any) {
            timer.invalidate()
            seconds=60
            countdownLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
            pauseButton.isEnabled = false
        }
        
        @objc func updateTimer() {
            if seconds < 1 {
                timer.invalidate() // send an alert
            } else{
            seconds -= 1
            countdownLabel.text = timeString(time: TimeInterval(seconds))}
        }
        
        func timeString(time:TimeInterval) -> String {
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            pauseButton.isEnabled = false
        }
        
}// END OF CLASS
