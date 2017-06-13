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
import Graph

class BaseVC: UIViewController, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {
    
    // images
    let backBtnImage = UIImage(named: "back_icon")
    let vtImage = UIImage(named: "vt_icon")
    let backgroundImage = UIImage(named: "intro_background")
    
    // graph for core data
    let graph = Graph()
    
    // fonts
    let standardFont = UIFont(name: "SFUIText-Light", size: 15)
    let heavyFont = UIFont(name: "SFUIDisplay-Thin", size: 30)
    let subtitleFont = UIFont(name: "SFUIText-LightItalic", size: 15)
    
    // current person
    var currentUser: Person {
        return AuthService.instance.getSignedInUser()
    }
    
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

