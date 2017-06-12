//
//  MyDashboard.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

let profileNotification = Notification.Name("profileNotification")

let portals = ["client", "trainer"]

var currentPortal = " "

class MyDashboard: UITabBarController, UITabBarControllerDelegate {

    let barTintColor = UIColor.init(red: 57/255, green: 95/255, blue: 167/255, alpha: 1.0)
    
    let inbox = InboxVC()
    let trainerDiscover = DiscoverTrainerVC()
    let clientDiscover = DiscoverClientVC()
    let scheduling = SchedulingVC()
    let appointment = AppointmentVC()
    let profile = ClientVC()
    let trainerProfile = TrainerVC()
    let wallet = WalletVC()
    
    var inboxNC : NavController!
    var trainerDiscoverNC : NavController!
    var clientDiscoverNC : NavController!
    var appointmentNC : NavController!
    var schedulingNC : NavController!
    var profileNC : NavController!
    var trainerProfileNC : NavController!
    var walletNC : NavController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        currentPortal = portals[0]

        // tab bar images
        let inboxImage = UIImage(named: "inbox_ic")
        let discoverImage = UIImage(named: "discover_ic")
        let schedulingImage = #imageLiteral(resourceName: "calendar_ic.png")
        let profileImage = UIImage(named: "profile_ic")
        let walletImage = #imageLiteral(resourceName: "wallet_2_ic")
        
        // tab bar controllers
        inbox.tabBarItem = UITabBarItem(title: "Inbox", image: inboxImage, tag: 0)
        inboxNC = NavController(rootViewController: inbox)
        inboxNC.navigationBar.topItem?.title = "Inbox"
        inboxNC.navigationBar.barTintColor = barTintColor
        
        trainerDiscover.tabBarItem = UITabBarItem(title: "Discover", image: discoverImage, tag: 1)
        trainerDiscoverNC = NavController(rootViewController: trainerDiscover)
        trainerDiscoverNC.navigationBar.topItem?.title = "Discover"
        trainerDiscoverNC.navigationBar.barTintColor = barTintColor
        
        clientDiscover.tabBarItem = UITabBarItem(title: "Discover", image: discoverImage, tag: 1)
        clientDiscoverNC = NavController(rootViewController: clientDiscover)
        clientDiscoverNC.navigationBar.topItem?.title = "Discover"
        clientDiscoverNC.navigationBar.barTintColor = barTintColor
        
        appointment.tabBarItem = UITabBarItem(title: "Appointment", image: schedulingImage, tag: 2)
        appointmentNC = NavController(rootViewController: appointment)
        appointmentNC.navigationBar.topItem?.title = "Appointment"
        appointmentNC.navigationBar.barTintColor = barTintColor
        
        scheduling.tabBarItem = UITabBarItem(title: "Appointments", image: schedulingImage, tag: 3)
        schedulingNC = NavController(rootViewController: scheduling)
        schedulingNC.navigationBar.topItem?.title = "Appointments"
        schedulingNC.navigationBar.barTintColor = barTintColor
        
       
        profile.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 4)
        profileNC = NavController(rootViewController: profile)
        profileNC.navigationBar.isHidden = true


        trainerProfile.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 5)
        trainerProfileNC = NavController(rootViewController: trainerProfile)
        trainerProfileNC.navigationBar.isHidden = true
        
        wallet.tabBarItem = UITabBarItem(title: "Wallet", image: walletImage, tag: 6)
        walletNC = NavController(rootViewController: wallet)
        walletNC.navigationBar.topItem?.title = "Wallet"
        walletNC.navigationBar.barTintColor = barTintColor
        
        self.viewControllers = [appointmentNC, trainerDiscoverNC, inboxNC, profileNC]
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.switchTrainerPortal(_:)), name: switchToTrainerPortal, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.switchTraineePortal(_:)), name: switchToTraineePortal, object: nil)

    
    }
    
    func switchTrainerPortal(_ notification: Notification) {
        currentPortal = portals[1]
        self.viewControllers = [inboxNC, clientDiscoverNC, schedulingNC, walletNC, trainerProfileNC]
    }
    
    func switchTraineePortal(_ notification: Notification) {
        currentPortal = portals[0]
        self.viewControllers = [appointmentNC, trainerDiscoverNC, inboxNC, profileNC]
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 3 {
    //        NotificationCenter.default.post(name: profileNotification, object: nil, userInfo: nil)
        }
    }
    
    
      
    
}
