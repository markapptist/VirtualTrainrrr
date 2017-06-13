//
//  MyDashboard.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation
import FirebaseDatabase

//let profileNotification = Notification.Name("profileNotification")

let portals = ["client", "trainer"]

var currentPortal = " "

class MyDashboard: UITabBarController, UITabBarControllerDelegate, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {
    
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
    
    // calling objects
    var callView: CallView?
    var callObj: OneToOneCall?
    
    // database references
    var callingRef: DatabaseReference?
    var incomingCallRef: DatabaseReference?
    var acceptCallRef: DatabaseReference?
    var endCallRef: DatabaseReference?
    var messagesRef: DatabaseReference?
    var notificationsRef: DatabaseReference?
    
    // core location properties
    var locationManager: CLLocationManager!
    var currentLocation: CLLocationCoordinate2D?
    
    /*
    var currentUser: Person {
        return AuthService.instance.getSignedInUser()
    }
    */
    
    // notification center
    var center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        // location manager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
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
        
        /*
         callView = CallView()
         callView?.isHidden = true
         self.view.addSubview(callView!)
         callView?.translatesAutoresizingMaskIntoConstraints = false
         callView?.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
         callView?.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
         callView?.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.50).isActive = true
         callView?.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.30).isActive = true
         */
    }
    
    // addtional set up
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
//        let userUID = currentUser.uid
        
        locationManager.startUpdatingLocation()
        
//        callingRef = DataService.instance.usersRef.child(userUID).child("/Phone/Calling")
//        incomingCallRef = DataService.instance.usersRef.child(userUID).child("/Phone/Incoming")
//        acceptCallRef = DataService.instance.usersRef.child(userUID).child("/Phone/Accepted")
//        endCallRef = DataService.instance.usersRef.child(userUID).child("/Phone/Ended")
//        messagesRef = DataService.instance.usersRef.child(userUID).child("/Inbox/Messages")
        //        notificationsRef = DataService.instance.usersRef.child(userUID).child("/test")
        
        // create database observers
        self.createObservers()
        
        // notification request if not granted in register process
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (granted:Bool, error:Error?) in
            if error != nil {
                print(error?.localizedDescription)
            }
            if granted {
                print("Permission granted")
            } else {
                print("Permission not granted")
            }
        }
        center.delegate = self
    }
    
    
    // MARK: - CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            
            self.currentLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            if currentPortal == "Trainer" {
                // save to database
//                DataService.instance.updateCoordinates(latitude: latitude, longitude: longitude, email: currentUser.email, accountUID: currentUser.uid)
            }
        }
    }
    
    // Portals switch
    func switchTrainerPortal(_ notification: Notification) {
        currentPortal = portals[1]
        self.viewControllers = [inboxNC, clientDiscoverNC, schedulingNC, walletNC, trainerProfileNC]
        
        // location manager update location
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func switchTraineePortal(_ notification: Notification) {
        currentPortal = portals[0]
        self.viewControllers = [appointmentNC, trainerDiscoverNC, inboxNC, profileNC]
        
        // remove location
//        DataService.instance.removeOnlineStatus(uid: currentUser.id)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 3 {
            //        NotificationCenter.default.post(name: profileNotification, object: nil, userInfo: nil)
        }
    }
    
    // MARK: - Database Observers
    func createObservers() {
        /*
        self.callingRef?.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                let callInfo = snapshot.value as? NSDictionary
                self.didCreateCall(info: callInfo)
            }
        })
        self.incomingCallRef?.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                let callInfo = snapshot.value as? NSDictionary
                self.didReceiveCall(info: callInfo)
            }
        })
        self.acceptCallRef?.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                self.didAcceptCall()
            }
        })
        self.endCallRef?.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                self.didCancelCall()
            }
        })
        self.messagesRef?.observe(.childAdded, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                // message appointment confirmation notification
            }
        })
        self.notificationsRef?.observe(.value, with: { (snapshot) in
            print(snapshot)
            if snapshot.exists() {
                let request = LocalNotification.instance.setNotification(title: "hey", body: "text", timeInterval: 2)
                LocalNotification.instance.createNotification(center: self.center, request: request)
                // appointment notifications
            }
        })
 */
    }
    /*
    // MARK: - Phone
    
    func didCreateCall(info: NSDictionary?) {
        let sessionID = info?["sessionID"] as? String
        let sessionToken = info?["token"] as? String
        let trainerEmail = info?["email"] as? String
        let trainerUID = info?["trainerUID"] as? String
        let trainer = Trainer(uid: trainerEmail!, email: trainerUID!, name: nil)
        let myID = currentUser.uid
        let myEmail = currentUser.email
        let seeker = User(uid: myID, email: myEmail, name: nil)
        let callDetails = OneToOneCall()
        callDetails.sessionID = sessionID
        callDetails.token = sessionToken
        callDetails.trainer = trainer
        callDetails.user = seeker
        callView?.setTitles(option: .caller)
        callView?.userEmailLabel?.text = trainerEmail!
        self.callObj = callDetails
        callView?.callObj = self.callObj!
        self.view.addSubview(callView!)
    }
    
    func didReceiveCall(info: NSDictionary?) {
        let sessionID = info?["sessionID"] as? String
        let sessionToken = info?["token"] as? String
        let seekerEmail = info?["email"] as? String
        let seekerUID = info?["seekerUID"] as? String
        let seeker = User(uid: seekerUID!, email: seekerEmail!, name: nil)
        let myID = currentUser.uid
        let myEmail = currentUser.email
        let myTrainer = Trainer(uid: myID, email: myEmail, name: nil)
        let callDetails = OneToOneCall()
        callDetails.sessionID = sessionID
        callDetails.token = sessionToken
        callDetails.trainer = myTrainer
        callDetails.user = seeker
        callView?.setTitles(option: .responder)
        callView?.userEmailLabel?.text = seekerEmail!
        self.callObj = callDetails
        callView?.callObj = self.callObj!
        self.view.addSubview(callView!)
    }
    /*
    func didAcceptCall() {
        // tokbox vc
        let tokboxVC = TokboxVC()
        tokboxVC.callObj = self.callObj!
        self.present(tokboxVC, animated: true) {
            self.callView?.removeFromSuperview()
        }
    }
    */
    func didCancelCall() {
        self.callView?.removeFromSuperview()
    }
    */
}
