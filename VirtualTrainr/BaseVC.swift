//
//  BaseVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import UserNotifications
import CoreLocation

enum UserDefaultItems {
    case activity, howOften, travelRange, timesFree, days
    
    func nameDefaults() -> String {
        switch self {
        case .activity:
            return "Activity"
        case .howOften:
            return "HowOften"
        case .travelRange:
            return "TravelRange"
        case .timesFree:
            return "TimesFree"
        case .days:
            return "Days"
        }
    }
}

class BaseVC: UIViewController, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {
    
    let userDefaults = UserDefaults.standard
    
    // images
    let backBtnImage = UIImage(named: "back_icon")
    let vtImage = UIImage(named: "vt_icon")
    let backgroundImage = UIImage(named: "intro_background")
    
    // fonts
    let standardFont = UIFont(name: "SFUIText-Light", size: 15)
    let heavyFont = UIFont(name: "SFUIDisplay-Thin", size: 30)
    let subtitleFont = UIFont(name: "SFUIText-LightItalic", size: 15)
    
    /*
    // current person
    var currentUser: Person {
        return AuthService.instance.getSignedInUser()
    }
    */
    
    // nav bar height
    var navBarHeight: CGFloat? {
        return self.navigationController?.navigationBar.frame.height
    }
    
    var tabBar: UITabBar? {
        return self.tabBarController?.tabBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

