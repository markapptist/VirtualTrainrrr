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
    
    // graph for core data
    let graph = Graph()
    
    // add additional set up required variables
    let standardFont = UIFont(name: "SFUIText-Light", size: 15)
    
    var currentUser: Person {
        return AuthService.instance.getSignedInUser()
    }
    
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

