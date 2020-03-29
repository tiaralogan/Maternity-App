//
//  SettingSections.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/26/20.
//  Copyright © 2020 Logan. All rights reserved.
//

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingSections: Int, CaseIterable, CustomStringConvertible {
    case Social
    case Communications
    
    var description: String {
        switch self {
        case .Social: return "Social"
        case .Communications: return "Communications"
        }
    }
}
// Section  for the user to edit the userProfile, edit the email or to logout of the app
enum SocialOptions: Int, CaseIterable, SectionType {
    case editProfile
    case logout
    case email
    
    var containsSwitch: Bool { return false }
    
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .logout: return "Log Out"
        case .email: return "Email"
        }
    }
}

//Section for the user to add notification or report crashes

enum CommunicationOptions: Int, CaseIterable,
SectionType {
    case notifications
    case reportCrashes
    
    var containsSwitch: Bool {
        switch self {
        case .notifications: return true
        case .reportCrashes: return true
        }
    }
    
    var description: String {
        switch self {
        case .notifications: return "Notifications"
        case .reportCrashes: return "Report Crashes"
        }
    }
}
