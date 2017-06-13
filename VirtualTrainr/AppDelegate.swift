//
//  AppDelegate.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FacebookCore
import GoogleSignIn
import GoogleMaps
import GooglePlaces
import Stripe

let userDefaults = UserDefaults.standard

//let signedInNotification = Notification.Name("signedIn")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        STPPaymentConfiguration.shared().publishableKey = "pk_test_MhzYed5BZgYlLLVlL99txvlg"
        STPPaymentConfiguration.shared().appleMerchantIdentifier = "merchant.com.com.VirtualTrainr"
        
        GMSServices.provideAPIKey("AIzaSyCG9tiEX9Kh8EmX3kN-o7IpOOvHm_rBSKM")
        
        GMSPlacesClient.provideAPIKey("AIzaSyCG9tiEX9Kh8EmX3kN-o7IpOOvHm_rBSKM")
        
        FirebaseApp.configure()
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        
        UserDefaults.standard.set(false, forKey: "facebookCheck")
        UserDefaults.standard.set(false, forKey: "googleCheck")
        UserDefaults.standard.set(false, forKey: "linkedInCheck")
        
        let entryScreen = EntryScreen()
        
        let dashboard = AppContainerViewController()
                
//        // tab bar images
//        let inboxImage = UIImage(named: "inbox_ic")
//        let discoverImage = UIImage(named: "discover_ic")
//        let schedulingImage = #imageLiteral(resourceName: "calendar_ic.png")
//        let walletImage = UIImage(named: "wallet_ic")
//        let profileImage = UIImage(named: "profile_ic")
//        
//        // tab bar controllers
//        let inbox = InboxVC()
//        inbox.tabBarItem = UITabBarItem(title: "Inbox", image: inboxImage, tag: 0)
//        let inboxNC = NavController(rootViewController: inbox)
//        
//        let discover = DiscoverVC()
//        discover.tabBarItem = UITabBarItem(title: "Discover", image: discoverImage, tag: 1)
//        let discoverNC = NavController(rootViewController: discover)
//        
//        let scheduling = SchedulingVC()
//        scheduling.tabBarItem = UITabBarItem(title: "Scheduling", image: schedulingImage, tag: 2)
//        let schedulingNC = NavController(rootViewController: scheduling)
//        
//        let wallet = WalletVC()
//        wallet.tabBarItem = UITabBarItem(title: "Wallet", image: walletImage, tag: 3)
//        let walletNC = NavController(rootViewController: wallet)
//        
//        let profile = ProfileVC()
//        profile.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, tag: 4)
//        let profileNC = NavController(rootViewController: profile)
//        
//        dashboard.viewControllers = [inboxNC, discoverNC, schedulingNC, walletNC, profileNC]
        
        if(UserDefaults.standard.bool(forKey: "userLoggedIn") == true) {
            window?.rootViewController = dashboard
        } else {
            window?.rootViewController = entryScreen
        }
        /*
        let applePay = ApplePayVC()
        window?.rootViewController = applePay
         */
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let err = error {
            print("Failed to log into Google: ", err)
            return
        } else {
        
        print("Successfully logged into Google", user)
        NotificationCenter.default.post(name: signedInNotification, object: nil)
            
        }
        
        guard let idToken = user.authentication.idToken else {return}
        guard let accessToken = user.authentication.accessToken else {return}
        
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            
            if let err = error {
                print("Failed to create a Firebase User with Google account: ", err)
                return
            }
            
            guard let uid = user?.uid else { return }
            print("Successfully logged into Firebase with Google", uid)
        })
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options [UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        GIDSignIn.sharedInstance().handle(url, sourceApplication: options [UIApplicationOpenURLOptionsKey.sourceApplication] as! String!, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        AppEventsLogger.activate(application)

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

