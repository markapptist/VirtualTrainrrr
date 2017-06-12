//
//  ProfileVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/3/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import GoogleSignIn
import CoreLocation
import CoreText

let closeNotification = Notification.Name("Notification")

class ClientVC: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!

    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let topView = UIView()
    
    let nameLbl = UILabel()
    
    let locationLbl = UILabel()
    
    let verifiedLbl = UILabel()
    
    let tabBtn1 = UIButton()

    let tabBtn2 = UIButton()

    let tabBtn3 = UIButton()
    
    let tabView = UIView()
    
    let tabSwitch = UISegmentedControl()
    
    let containerView = UIView()
    
    let trainersTab = MyTrainersSegmentVC()
    
    let profileTab = ProfileSegmentVC()
    
    let editProfileTab = EditProfileSegmentVC()

    let favTab = MyFavouritesSegmentVC()
    
    let transactionTab = TransactionHistorySegmentVC()

    let paymentsTab = PaymentSegmentVC()

    let settingsTab = SettingsSegmentVC()
    
    let verificationTab = VerificationSegmentVC()
    
    //BADGES
    let facebookSym = UIImageView()
    let emailSym = UIImageView()
    let phoneSym = UIImageView()
    let googleSym = UIImageView()
    let linkedInSym = UIImageView()
    let cardSym = UIImageView()
    
    let closeBtn = UIButton()
    
    let pictureBtn = UIButton()
    
    let filterView = UIView()
    
    let updatedImgView = UIImageView()
    
    var blurShown = false

    
    let shareView = UIView()
    
    let languageView = UIView()
    
    let contentView = UITableView()
    
    let facebookBtn = UIButton()
    let linkedInBtn = UIButton()
    let googleBtn = UIButton()
    let shareEmailBtn = UIButton()
    let shareTextBtn = UIButton()
    
    let faceBookLbl = UILabel()
    let linkedInLbl = UILabel()
    let googleLbl = UILabel()
    let shareEmailLbl = UILabel()
    let shareTextLbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        topView.backgroundColor = UIColor.init(red: 63/255, green: 108/255, blue: 171/255, alpha: 1.0)
        
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        topView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.37).isActive = true
        
        topView.addSubview(imageView)
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.makeRound()
        imageView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 20)
        nameLbl.text = "Name"
        nameLbl.textAlignment = .center
        nameLbl.textColor = UIColor.white
        self.view.addSubview(nameLbl)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10).isActive = true
        nameLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        nameLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.1).isActive = true
        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        locationLbl.text = "Location"
        locationLbl.adjustsFontSizeToFitWidth = true 
        locationLbl.textAlignment = .center
        locationLbl.textColor = UIColor.white
        self.view.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.topAnchor.constraint(equalTo: self.nameLbl.bottomAnchor, constant: 0).isActive = true
        locationLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.nameLbl.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.1).isActive = true
   
        let locationIcon = UIImageView()
        locationIcon.image = #imageLiteral(resourceName: "profile_location_ic.png")
        self.view.addSubview(locationIcon)
        
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.trailingAnchor.constraint(equalTo: self.locationLbl.leadingAnchor, constant: -6).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: self.locationLbl.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.07).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.5).isActive = true
     
        verifiedLbl.font = UIFont(name: "SFUIDisplay-Light", size: 14)
        verifiedLbl.text = "Verified:"
        verifiedLbl.textAlignment = .left
        verifiedLbl.textColor = UIColor.white
        self.view.addSubview(verifiedLbl)
        verifiedLbl.translatesAutoresizingMaskIntoConstraints = false
        verifiedLbl.topAnchor.constraint(equalTo: self.locationLbl.bottomAnchor, constant: 3).isActive = true
        verifiedLbl.leadingAnchor.constraint(equalTo: locationIcon.leadingAnchor, constant: -20).isActive = true
        verifiedLbl.widthAnchor.constraint(equalTo: self.nameLbl.widthAnchor, multiplier: 0.15).isActive = true
        verifiedLbl.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 0.1).isActive = true
    
        tabView.backgroundColor = UIColor.lightGray
        self.view.addSubview(tabView)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        tabView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tabView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        tabView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
 
        self.view.addSubview(tabBtn1)
        tabBtn1.translatesAutoresizingMaskIntoConstraints = false
        tabBtn1.leadingAnchor.constraint(equalTo: tabView.leadingAnchor).isActive = true
        tabBtn1.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        tabBtn1.heightAnchor.constraint(equalTo: tabView.heightAnchor, multiplier: 1.0).isActive = true
        tabBtn1.widthAnchor.constraint(equalTo: tabView.widthAnchor, multiplier: 0.333).isActive = true
        tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic_white.png"), for: .normal)
        tabBtn1.addTarget(self, action: #selector(tabBtn1Pressed), for: .touchUpInside)
        
        self.view.addSubview(tabBtn2)
        tabBtn2.translatesAutoresizingMaskIntoConstraints = false
        tabBtn2.leadingAnchor.constraint(equalTo: tabBtn1.trailingAnchor).isActive = true
        tabBtn2.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        tabBtn2.heightAnchor.constraint(equalTo: tabView.heightAnchor, multiplier: 1.0).isActive = true
        tabBtn2.widthAnchor.constraint(equalTo: tabView.widthAnchor, multiplier: 0.333).isActive = true
        tabBtn2.setImage(#imageLiteral(resourceName: "wallet_ic.png"), for: .normal)
        tabBtn2.addTarget(self, action: #selector(tabBtn2Pressed), for: .touchUpInside)
        
        self.view.addSubview(tabBtn3)
        tabBtn3.translatesAutoresizingMaskIntoConstraints = false
        tabBtn3.leadingAnchor.constraint(equalTo: tabBtn2.trailingAnchor).isActive = true
        tabBtn3.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        tabBtn3.heightAnchor.constraint(equalTo: tabView.heightAnchor, multiplier: 1.0).isActive = true
        tabBtn3.widthAnchor.constraint(equalTo: tabView.widthAnchor, multiplier: 0.333).isActive = true
        tabBtn3.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
        tabBtn3.addTarget(self, action: #selector(tabBtn3Pressed), for: .touchUpInside)
      
        
        tabSwitch.makeRound()
        self.view.addSubview(tabSwitch)
        tabSwitch.isHidden = true
        tabSwitch.insertSegment(withTitle: " ", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: " ", at: 1, animated: true)
        tabSwitch.setEnabled(true, forSegmentAt: 0)
        tabSwitch.setEnabled(true, forSegmentAt: 1)
        tabSwitch.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        tabSwitch.translatesAutoresizingMaskIntoConstraints = false
        tabSwitch.layer.cornerRadius = 5
        tabSwitch.tintColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
        tabSwitch.topAnchor.constraint(equalTo: tabView.bottomAnchor, constant: 10).isActive = true
        tabSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabSwitch.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        tabSwitch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.tabSwitch.bottomAnchor, constant: 5).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true 
        
        if UserDefaults.standard.bool(forKey: "facebookCheck") == true {
            self.getFacebookUserInfo()
        }
        
        if UserDefaults.standard.bool(forKey: "googleCheck") == true {
            self.getGoogleUserInfo()
        }
        
        if UserDefaults.standard.bool(forKey: "linkedInCheck") == true {
            self.getLinkedInInfo()
        }
        
        self.view.addSubview(facebookSym)
        facebookSym.image = #imageLiteral(resourceName: "facebook_verify_ic.png")
        facebookSym.translatesAutoresizingMaskIntoConstraints = false
        facebookSym.leadingAnchor.constraint(equalTo: verifiedLbl.trailingAnchor, constant: 3).isActive = true
        facebookSym.centerYAnchor.constraint(equalTo: verifiedLbl.centerYAnchor).isActive = true
        facebookSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        facebookSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        facebookSym.isHidden = false
        
        self.view.addSubview(emailSym)
        emailSym.image = #imageLiteral(resourceName: "verify_email_btn")
        emailSym.translatesAutoresizingMaskIntoConstraints = false
        emailSym.leadingAnchor.constraint(equalTo: facebookSym.trailingAnchor, constant: 3).isActive = true
        emailSym.centerYAnchor.constraint(equalTo: verifiedLbl.centerYAnchor).isActive = true
        emailSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailSym.isHidden = false
        
        self.view.addSubview(phoneSym)
        phoneSym.image = #imageLiteral(resourceName: "profile_verify_btn")
        phoneSym.translatesAutoresizingMaskIntoConstraints = false
        phoneSym.leadingAnchor.constraint(equalTo: emailSym.trailingAnchor, constant: 3).isActive = true
        phoneSym.centerYAnchor.constraint(equalTo: verifiedLbl.centerYAnchor).isActive = true
        phoneSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        phoneSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneSym.isHidden = false
        
        self.view.addSubview(googleSym)
        googleSym.image = #imageLiteral(resourceName: "gmail_verify_ic.png")
        googleSym.translatesAutoresizingMaskIntoConstraints = false
        googleSym.leadingAnchor.constraint(equalTo: phoneSym.trailingAnchor, constant: 3).isActive = true
        googleSym.centerYAnchor.constraint(equalTo: verifiedLbl.centerYAnchor).isActive = true
        googleSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        googleSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        googleSym.isHidden = false
        
        self.view.addSubview(linkedInSym)
        linkedInSym.image = #imageLiteral(resourceName: "gmail_verify_ic.png")
        linkedInSym.translatesAutoresizingMaskIntoConstraints = false
        linkedInSym.leadingAnchor.constraint(equalTo: googleSym.trailingAnchor, constant: 3).isActive = true
        linkedInSym.centerYAnchor.constraint(equalTo: verifiedLbl.centerYAnchor).isActive = true
        linkedInSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        linkedInSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        linkedInSym.isHidden = false
        
        self.view.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)

        self.view.addSubview(pictureBtn)
        pictureBtn.setImage(#imageLiteral(resourceName: "edit_ic.png"), for: .normal)
        pictureBtn.translatesAutoresizingMaskIntoConstraints = false
        pictureBtn.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 0).isActive = true
        pictureBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        pictureBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        pictureBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pictureBtn.addTarget(self, action: #selector(pictureBtnPressed), for: .touchUpInside)
        
        let shareIconBtn = UIButton()
        self.view.addSubview(shareIconBtn)
        shareIconBtn.setImage(#imageLiteral(resourceName: "profile_share_btn"), for: .normal)
        shareIconBtn.translatesAutoresizingMaskIntoConstraints = false
        shareIconBtn.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30).isActive = true
        shareIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        shareIconBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.addTarget(self, action: #selector(makeShareView), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(self.callMakeFilterView(_:)), name: thirdNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.callMakeLanguageView(_:)), name: fourthNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.callEditBio(_:)), name: editBioNotification, object: nil)
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.isHidden = true
        
        
        }
    
    func callEditBio(_ notification: Notification) {
        
        present(editProfileTab, animated: false, completion: nil)

    }
    
    func callMakeLanguageView(_ notification: Notification) {
        self.makeLanguageView()
    }

    
    func callMakeFilterView(_ notification: Notification) {
        
        if currentTag == "0" {
            self.makeFilterView(title: "Select Training Interests", tag: 0).isHidden = false
        }
        
        if currentTag == "1" {
            self.makeFilterView(title: "Select Fitness Goals", tag: 1).isHidden = false
        }
        
        if currentTag == "2" {
            self.makeFilterView(title: "Select Training Frequency", tag: 2).isHidden = false
        }
        
        if currentTag == "3" {
            self.makeFilterView(title: "Select Days Your Available", tag: 3).isHidden = false
        }
        
        if currentTag == "4" {
            self.makeFilterView(title: "Select Times Your Available", tag: 4).isHidden = false
        }
        
        if currentTag == "5" {
            self.makeFilterView(title: "Distance Your Willing To Travel", tag: 5).isHidden = false
        }
        
    }
    
    func closeBtnPressed() {
        
     //   self.dismiss(animated: true, completion: nil)
        
     //   NotificationCenter.default.post(name: closeNotification, object: nil, userInfo: nil)

       self.tabBarController?.selectedIndex = 0
    }
    
    func pictureBtnPressed() {
        
        present(CameraVC(), animated: false, completion: nil)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        tabBtn1Pressed()
        
        indexChanged()
        
        self.tabBarController?.tabBar.isHidden = true

    }
    
  
    func tabBtn1Pressed() {
        
        tabSwitch.isHidden = false
        
        if !tabBtn1.isSelected {
            tabBtn1.backgroundColor = UIColor.white
            tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic.png"), for: .normal)
            tabBtn1.isSelected = true
            
            tabSwitch.selectedSegmentIndex = 0
            
            
            if tabSwitch.numberOfSegments == 2 {
                
            tabSwitch.insertSegment(withTitle: "Favourites", at: 2, animated: true)
            
            }
            
            tabSwitch.setTitle("Profile", forSegmentAt: 0)
            tabSwitch.setTitle("My Trainers", forSegmentAt: 1)
            tabSwitch.setTitle("Favourites", forSegmentAt: 2)

        }
        
        if tabBtn2.isSelected {
            tabBtn2.backgroundColor = UIColor.lightGray
            tabBtn2.setImage(#imageLiteral(resourceName: "wallet_ic.png"), for: .normal)
            tabBtn2.isSelected = false
        }
        
        if tabBtn3.isSelected {
            tabBtn3.backgroundColor = UIColor.lightGray
            tabBtn3.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
            tabBtn3.isSelected = false
        }
        
        indexChanged()

        
    }
    
    func tabBtn2Pressed() {
        
        
        tabSwitch.isHidden = false

        
        if !tabBtn2.isSelected {
            tabBtn2.backgroundColor = UIColor.white
            tabBtn2.setImage(#imageLiteral(resourceName: "wallet_2_ic"), for: .normal)
            tabBtn2.isSelected = true
            
            tabSwitch.selectedSegmentIndex = 0
            
            
            tabSwitch.setTitle("Transaction History", forSegmentAt: 0)
            tabSwitch.setTitle("Payment Method", forSegmentAt: 1)
            
            if tabSwitch.numberOfSegments > 2 {
          
            tabSwitch.removeSegment(at: 2, animated: true)
            
            }
            
        }
        
        if tabBtn1.isSelected {
            tabBtn1.backgroundColor = UIColor.lightGray
            tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic_white.png"), for: .normal)
            tabBtn1.isSelected = false
        }
        
        if tabBtn3.isSelected {
            tabBtn3.backgroundColor = UIColor.lightGray
            tabBtn3.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
            tabBtn3.isSelected = false
        }
        
        indexChanged()

        
    }
    
    func tabBtn3Pressed() {
        
        tabSwitch.isHidden = false

        
        if !tabBtn3.isSelected {
            tabBtn3.backgroundColor = UIColor.white
            tabBtn3.setImage(#imageLiteral(resourceName: "settings_ic_gray.png"), for: .normal)
            tabBtn3.isSelected = true
            
            tabSwitch.selectedSegmentIndex = 0
            
            tabSwitch.setTitle("Settings", forSegmentAt: 0)
            tabSwitch.setTitle("Verification", forSegmentAt: 1)
            
            if tabSwitch.numberOfSegments > 2 {

            tabSwitch.removeSegment(at: 2, animated: true)
            
            }

        }
        
        if tabBtn2.isSelected {
            tabBtn2.backgroundColor = UIColor.lightGray
            tabBtn2.setImage(#imageLiteral(resourceName: "wallet_ic.png"), for: .normal)
            tabBtn2.isSelected = false
        }
        
        if tabBtn1.isSelected {
            tabBtn1.backgroundColor = UIColor.lightGray
            tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic_white.png"), for: .normal)
            tabBtn1.isSelected = false
        }
        
        indexChanged()


    }
 
    func indexChanged() {
        
        if tabBtn1.isSelected {
        
        paymentsTab.view.isHidden = true
        transactionTab.view.isHidden = true
        verificationTab.view.isHidden = true
        settingsTab.view.isHidden = true
            
        switch tabSwitch.selectedSegmentIndex {
        case 0:
            print("profile tab")
            profileTab.view.frame = containerView.bounds
            self.addChildViewController(profileTab)
            self.containerView.addSubview(profileTab.view)
            
            if(profileTab.isViewLoaded){
                
                if(profileTab.view.isHidden) {
                    profileTab.view.isHidden = false
                }
                trainersTab.view.isHidden = true
                favTab.view.isHidden = true
            }
        case 1:
            print("my trainers")
            self.addChildViewController(trainersTab)
            trainersTab.tableView.delegate = self
        
            trainersTab.view.frame = containerView.bounds
            self.containerView.addSubview(trainersTab.view)
            trainersTab.didMove(toParentViewController: self)
            if(trainersTab.isViewLoaded) {
                
                if(trainersTab.view.isHidden) {
                    trainersTab.view.isHidden = false
                }
                
                profileTab.view.isHidden = true
                favTab.view.isHidden = true
            }

        case 2:
            print("favourites")
            favTab.view.frame = containerView.bounds
            self.addChildViewController(favTab)
            self.containerView.addSubview(favTab.view)
            
            if(favTab.isViewLoaded) {
                
                if(favTab.view.isHidden) {
                    favTab.view.isHidden = false
                }
                
                profileTab.view.isHidden = true
                trainersTab.view.isHidden = true
                
            }
 
        default:
            break
        }
            
        }
        
        if tabBtn2.isSelected {
            
            profileTab.view.isHidden = true
            favTab.view.isHidden = true
            trainersTab.view.isHidden = true
            verificationTab.view.isHidden = true
            settingsTab.view.isHidden = true
            
            switch tabSwitch.selectedSegmentIndex {
            case 0:
                print("transaction history")
                transactionTab.view.frame = containerView.bounds
                self.addChildViewController(transactionTab)
                containerView.addSubview(transactionTab.view)
                
                if(transactionTab.isViewLoaded) {
                    
                    if(transactionTab.view.isHidden) {
                        transactionTab.view.isHidden = false
                    }
                    
                    paymentsTab.view.isHidden = true
                    
                }
                
            case 1:
                print("payment method")
                paymentsTab.view.frame = containerView.bounds
                self.addChildViewController(paymentsTab)
                containerView.addSubview(paymentsTab.view)
                
                if(paymentsTab.isViewLoaded) {
                    
                    if(paymentsTab.view.isHidden) {
                        paymentsTab.view.isHidden = false
                        
                    }
                    
                    transactionTab.view.isHidden = true
                }

            default:
                break
            }
            
        }
        
        if tabBtn3.isSelected {
            
            profileTab.view.isHidden = true
            favTab.view.isHidden = true
            trainersTab.view.isHidden = true
            paymentsTab.view.isHidden = true
            transactionTab.view.isHidden = true
            
            switch tabSwitch.selectedSegmentIndex {
            case 0:
                print("settings")
                settingsTab.view.frame = containerView.bounds
                self.addChildViewController(settingsTab)
                settingsTab.locationViewTitle = self.locationLbl.text!
                containerView.addSubview(settingsTab.view)
                
                if(settingsTab.isViewLoaded) {
                    
                    if(settingsTab.view.isHidden) {
                        settingsTab.view.isHidden = false
                    }
                    
                    verificationTab.view.isHidden = true
                    
                }
                
            case 1:
                print("settings")
                verificationTab.view.frame = containerView.bounds
                self.addChildViewController(verificationTab)
                containerView.addSubview(verificationTab.view)
                
                if(verificationTab.isViewLoaded) {
                    
                    if(verificationTab.view.isHidden) {
                        verificationTab.view.isHidden = false
                        
                    }
                    
                    settingsTab.view.isHidden = true
                }
                
            default:
                break
            }

            
        }

     
    }
    
    func makeLanguageView() -> UIView {
        self.view.addSubview(languageView)
        
        if(languageView.isDescendant(of: self.view)) {
            languageView.isHidden = false
        }
        
        languageView.translatesAutoresizingMaskIntoConstraints = false
        languageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        languageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        languageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        languageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        let topView = UIView()
        languageView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.darkGray
        topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: languageView.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: languageView.heightAnchor, multiplier: 0.1).isActive = true
        topView.leadingAnchor.constraint(equalTo: languageView.leadingAnchor, constant: 0).isActive = true
        
        let topViewTitle = UILabel()
        topView.addSubview(topViewTitle)
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = "Select Language"
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 10).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        let closeBtn = UIButton()
        languageView.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 10).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: languageView.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeLanguageBtnPressed), for: .touchUpInside)
        
        languageView.addSubview(contentView)
        contentView.alpha = 0.9
        contentView.register(LanguageCell.self, forCellReuseIdentifier: "LanguageCell")
        contentView.dataSource = self
        contentView.delegate = self
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.black
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: languageView.heightAnchor, multiplier: 1.0).isActive = true
        contentView.widthAnchor.constraint(equalTo: languageView.widthAnchor, multiplier: 1.0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: languageView.leadingAnchor, constant: 0.0).isActive = true
        
        blurEffectView.isHidden = true
        
        blurEffectView.backgroundColor = UIColor.black
        blurEffectView.alpha = 1.0
        contentView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        blurEffectView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        return languageView
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath) as! LanguageCell
        
        cell.lbl.text = "English"
        
        return cell
    }
    
    func closeLanguageBtnPressed() {
        self.languageView.isHidden = true
    }
    

    
    func makeFilterView(title: String, tag: Int) -> UIView {
        
        self.view.addSubview(filterView)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        filterView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        filterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        filterView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        let topView = UIView()
        filterView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.gray
        topView.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: filterView.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: filterView.heightAnchor, multiplier: 0.12).isActive = true
        topView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 0).isActive = true
        
        let topViewTitle = UILabel()
        topView.addSubview(topViewTitle)
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = title
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        let closeBtn = UIButton()
        filterView.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeFilterBtnPressed), for: .touchUpInside)
        
        let contentView = UIView()
        filterView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.white
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: filterView.heightAnchor, multiplier: 1.0).isActive = true
        contentView.widthAnchor.constraint(equalTo: filterView.widthAnchor, multiplier: 1.0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 0.0).isActive = true
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.1)
        contentView.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        switch tag {
        case 0:
            let row1 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Cardio", itemTwoString: "Strength Training")
            
            let row2 = makeTwoButtonRow(anchor: row1, constant: 20, scrollView: scrollView, itemOneString: "Endurance", itemTwoString: "Weight Loss")
            
            let row3 = makeTwoButtonRow(anchor: row2, constant: 20, scrollView: scrollView, itemOneString: "Nutrition", itemTwoString: "Cross Fit")
            
            let row4 = makeTwoButtonRow(anchor: row3, constant: 20, scrollView: scrollView, itemOneString: "Dance", itemTwoString: "P90X")
            
            let row5 = makeTwoButtonRow(anchor: row4, constant: 20, scrollView: scrollView, itemOneString: "ABX4FIVE", itemTwoString: "Zumba")
            
            let row6 = makeTwoButtonRow(anchor: row5, constant: 20, scrollView: scrollView, itemOneString: "Power Lifting", itemTwoString: "BollyX")
            
            let row7 = makeTwoButtonRow(anchor: row6, constant: 20, scrollView: scrollView, itemOneString: "Bodyweight", itemTwoString: "HIIT")
            
            let row8 = makeTwoButtonRow(anchor: row7, constant: 20, scrollView: scrollView, itemOneString: "Personal Training", itemTwoString: "Yoga")
        
            
        case 1:
            let row9 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Weight Loss", itemTwoString: "Get Trimmed & Toned")
            
            let row10 = makeTwoButtonRow(anchor: row9, constant: 20, scrollView: scrollView, itemOneString: "Build Muscle & Strength", itemTwoString: "Become Healthier")
            
            let row11 = makeTwoButtonRow(anchor: row10, constant: 20, scrollView: scrollView, itemOneString: "Increase Aerobic Fitness", itemTwoString: "Body Building")
            
            let row12 = makeOneButtonRow(anchor: row11, constant: 20, scrollView: scrollView, itemOneString: "Holistic Mind & Body")
            
        case 2:
            let row13 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Daily", itemTwoString: "2-3 Days A Week")
            
            let row14 = makeTwoButtonRow(anchor: row13, constant: 20, scrollView: scrollView, itemOneString: "4 or More Days A Week", itemTwoString: "Once A Week")
            
            let row15 = makeOneButtonRow(anchor: row14, constant: 20, scrollView: scrollView, itemOneString: "Determined By Trainer")
        
        case 3:
            let row16 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Sunday", itemTwoString: "Monday")
            
            let row17 = makeTwoButtonRow(anchor: row16, constant: 20, scrollView: scrollView, itemOneString: "Tuesday", itemTwoString: "Wednesday")
            
            let row18 = makeTwoButtonRow(anchor: row17, constant: 20, scrollView: scrollView, itemOneString: "Thursday", itemTwoString: "Friday")
            
            let row19 = makeTwoButtonRow(anchor: row18, constant: 20, scrollView: scrollView, itemOneString: "Saturday", itemTwoString: "Sunday")

        case 4:
            let row20 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Before 9 am", itemTwoString: "9am-noon")
            
            let row21 = makeTwoButtonRow(anchor: row20, constant: 20, scrollView: scrollView, itemOneString: "noon-3pm", itemTwoString: "3pm-6pm")
            
            let row22 = makeOneButtonRow(anchor: row21, constant: 20, scrollView: scrollView, itemOneString: "After 6pm")
            
        case 5:
            let row23 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: scrollView, itemOneString: "Have Trainer Meet Me", itemTwoString: "5km-19km")
            
            let row24 = makeTwoButtonRow(anchor: row23, constant: 20, scrollView: scrollView, itemOneString: "20km or more", itemTwoString: "Virtual 1 on 1 Meeting")

        default:
            break
        }
        
        let nextBtn = UIButton()
        nextBtn.setImage(#imageLiteral(resourceName: "right_arrow_green_bt"), for: .normal)
        filterView.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor, constant: -20).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor, constant: -20).isActive = true
        nextBtn.addTarget(self, action: #selector(self.nextBtnPressed), for: .touchUpInside)
        return filterView
        
    }
    
    func nextBtnPressed() {
        
        closeFilterBtnPressed()
        blurEffectView.isHidden = false
        
        blurEffectView.backgroundColor = UIColor.darkGray
        blurEffectView.alpha = 0.8
        self.view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        blurEffectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        blurEffectView.addSubview(updatedImgView)
        
        updatedImgView.image = #imageLiteral(resourceName: "confirm_check_image")
        updatedImgView.translatesAutoresizingMaskIntoConstraints = false
        updatedImgView.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor).isActive = true
        updatedImgView.centerYAnchor.constraint(equalTo: blurEffectView.centerYAnchor).isActive = true
        updatedImgView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        updatedImgView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        let updatedLbl = UILabel()
        updatedLbl.text = "Availability Updated"
        updatedLbl.font = UIFont(name: "SFUIText-Medium", size: 26)
        updatedLbl.textColor = UIColor.white
        updatedLbl.textAlignment = .center
        blurEffectView.addSubview(updatedLbl)
        updatedLbl.translatesAutoresizingMaskIntoConstraints = false
        updatedLbl.widthAnchor.constraint(equalTo: blurEffectView.widthAnchor, multiplier: 0.9).isActive = true
        updatedLbl.heightAnchor.constraint(equalTo: blurEffectView.heightAnchor, multiplier: 0.1).isActive = true
        updatedLbl.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor).isActive = true
        updatedLbl.topAnchor.constraint(equalTo: updatedImgView.bottomAnchor, constant: 10).isActive = true
        
        blurShown = true
    }
    
    func makeShareView() -> UIView {
        
        self.view.addSubview(shareView)
        
        if(shareView.isDescendant(of: self.view)) {
            shareView.isHidden = false
        }
        shareView.translatesAutoresizingMaskIntoConstraints = false
        shareView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        shareView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        shareView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        shareView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        let topView = UIView()
        shareView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.darkGray
        topView.topAnchor.constraint(equalTo: shareView.topAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: shareView.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 0.1).isActive = true
        topView.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 0).isActive = true
        
        let topViewTitle = UILabel()
        topView.addSubview(topViewTitle)
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = "Share Profile"
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 10).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        let closeBtn = UIButton()
        shareView.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 10).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeShareBtnPressed), for: .touchUpInside)
        
        let contentView = UIView()
        shareView.addSubview(contentView)
        contentView.alpha = 0.9
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.black
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: shareView.heightAnchor, multiplier: 1.0).isActive = true
        contentView.widthAnchor.constraint(equalTo: shareView.widthAnchor, multiplier: 1.0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: shareView.leadingAnchor, constant: 0.0).isActive = true
        
        blurEffectView.isHidden = false
        
        blurEffectView.backgroundColor = UIColor.black
        blurEffectView.alpha = 1.0
        contentView.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        blurEffectView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        contentView.addSubview(facebookBtn)
        contentView.addSubview(googleBtn)
        contentView.addSubview(linkedInBtn)
        contentView.addSubview(shareEmailBtn)
        contentView.addSubview(shareTextBtn)
        
        //  facebookBtn.setTitle("Register with Facebook", for: .normal)
        facebookBtn.setImage(#imageLiteral(resourceName: "verify_facebook_ic"), for: .normal)
        facebookBtn.imageView?.contentMode = .scaleAspectFit
        facebookBtn.titleLabel?.contentMode = .right
        facebookBtn.titleLabel?.textColor = UIColor.white
        facebookBtn.layer.cornerRadius = 30
        facebookBtn.backgroundColor = UIColor.clear
        facebookBtn.layer.borderWidth = 1
        facebookBtn.layer.borderColor = UIColor.white.cgColor
        facebookBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        facebookBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        facebookBtn.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 30).isActive = true
        facebookBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        facebookBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        //       facebookBtn.addTarget(self, action: #selector(facebookbtnPressed), for: .touchUpInside)
        
        
        //   googleBtn.setTitle("Register with Google", for: .normal)
        googleBtn.setImage(#imageLiteral(resourceName: "verify_google_ic"), for: .normal)
        googleBtn.layer.cornerRadius = 30
        googleBtn.titleLabel?.textAlignment = .right
        googleBtn.titleLabel?.textColor = UIColor.white
        googleBtn.imageView?.contentMode = .scaleAspectFit
        googleBtn.backgroundColor = UIColor.clear
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = UIColor.white.cgColor
        googleBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleBtn.topAnchor.constraint(equalTo: facebookBtn.bottomAnchor, constant: 20).isActive = true
        googleBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        googleBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        //     googleBtn.addTarget(self, action: #selector(googlebtnPressed), for: .touchUpInside)
        
        
        //   linkedInBtn.setTitle("Register with LinkedIn", for: .normal)
        linkedInBtn.setImage(#imageLiteral(resourceName: "verify_linkedin_ic"), for: .normal)
        linkedInBtn.layer.cornerRadius = 30
        linkedInBtn.titleLabel?.textAlignment = .right
        linkedInBtn.titleLabel?.textColor = UIColor.white
        linkedInBtn.imageView?.contentMode = .scaleAspectFit
        linkedInBtn.backgroundColor = UIColor.clear
        linkedInBtn.layer.borderWidth = 1
        linkedInBtn.layer.borderColor = UIColor.white.cgColor
        linkedInBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        linkedInBtn.translatesAutoresizingMaskIntoConstraints = false
        linkedInBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        linkedInBtn.topAnchor.constraint(equalTo: googleBtn.bottomAnchor, constant: 20).isActive = true
        linkedInBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        linkedInBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        //       linkedInBtn.addTarget(self, action: #selector(linkedInbtnPressed), for: .touchUpInside)
        
        shareEmailBtn.layer.cornerRadius = 30
        shareEmailBtn.titleLabel?.textAlignment = .right
        shareEmailBtn.titleLabel?.textColor = UIColor.white
        shareEmailBtn.imageView?.contentMode = .scaleAspectFit
        shareEmailBtn.backgroundColor = UIColor.clear
        shareEmailBtn.layer.borderWidth = 1
        shareEmailBtn.layer.borderColor = UIColor.white.cgColor
        shareEmailBtn.translatesAutoresizingMaskIntoConstraints = false
        shareEmailBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        shareEmailBtn.topAnchor.constraint(equalTo: linkedInBtn.bottomAnchor, constant: 20).isActive = true
        shareEmailBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        shareEmailBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        
        shareTextBtn.layer.cornerRadius = 30
        shareTextBtn.titleLabel?.textAlignment = .right
        shareTextBtn.titleLabel?.textColor = UIColor.white
        shareTextBtn.imageView?.contentMode = .scaleAspectFit
        shareEmailBtn.backgroundColor = UIColor.clear
        shareTextBtn.layer.borderWidth = 1
        shareTextBtn.layer.borderColor = UIColor.white.cgColor
        shareTextBtn.translatesAutoresizingMaskIntoConstraints = false
        shareTextBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        shareTextBtn.topAnchor.constraint(equalTo: shareEmailBtn.bottomAnchor, constant: 20).isActive = true
        shareTextBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        shareTextBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.09).isActive = true
        
        
        facebookBtn.addSubview(faceBookLbl)
        linkedInBtn.addSubview(linkedInLbl)
        googleBtn.addSubview(googleLbl)
        shareEmailBtn.addSubview(shareEmailLbl)
        shareTextBtn.addSubview(shareTextLbl)
        
        faceBookLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        faceBookLbl.text = "Facebook"
        faceBookLbl.textAlignment = .center
        faceBookLbl.textColor = UIColor.white
        faceBookLbl.translatesAutoresizingMaskIntoConstraints = false
        faceBookLbl.centerXAnchor.constraint(equalTo: facebookBtn.centerXAnchor).isActive = true
        faceBookLbl.centerYAnchor.constraint(equalTo: facebookBtn.centerYAnchor).isActive = true
        faceBookLbl.widthAnchor.constraint(equalTo: facebookBtn.widthAnchor, multiplier: 0.7).isActive = true
        faceBookLbl.heightAnchor.constraint(equalTo: facebookBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        linkedInLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        linkedInLbl.text = "LinkedIn"
        linkedInLbl.textAlignment = .center
        linkedInLbl.textColor = UIColor.white
        linkedInLbl.translatesAutoresizingMaskIntoConstraints = false
        linkedInLbl.centerXAnchor.constraint(equalTo: linkedInBtn.centerXAnchor).isActive = true
        linkedInLbl.centerYAnchor.constraint(equalTo: linkedInBtn.centerYAnchor).isActive = true
        linkedInLbl.widthAnchor.constraint(equalTo: linkedInBtn.widthAnchor, multiplier: 1.0).isActive = true
        linkedInLbl.heightAnchor.constraint(equalTo: linkedInBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        googleLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        googleLbl.text = "Google"
        googleLbl.textAlignment = .center
        googleLbl.textColor = UIColor.white
        googleLbl.translatesAutoresizingMaskIntoConstraints = false
        googleLbl.centerXAnchor.constraint(equalTo: googleBtn.centerXAnchor).isActive = true
        googleLbl.centerYAnchor.constraint(equalTo: googleBtn.centerYAnchor).isActive = true
        googleLbl.widthAnchor.constraint(equalTo: googleBtn.widthAnchor, multiplier: 1.0).isActive = true
        googleLbl.heightAnchor.constraint(equalTo: googleBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        shareEmailLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        shareEmailLbl.text = "Share with Email"
        shareEmailLbl.textAlignment = .center
        shareEmailLbl.textColor = UIColor.white
        shareEmailLbl.translatesAutoresizingMaskIntoConstraints = false
        shareEmailLbl.centerXAnchor.constraint(equalTo: shareEmailBtn.centerXAnchor).isActive = true
        shareEmailLbl.centerYAnchor.constraint(equalTo: shareEmailBtn.centerYAnchor).isActive = true
        shareEmailLbl.widthAnchor.constraint(equalTo: shareEmailBtn.widthAnchor, multiplier: 1.0).isActive = true
        shareEmailLbl.heightAnchor.constraint(equalTo: shareEmailBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        shareTextLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        shareTextLbl.text = "Share with Text"
        shareTextLbl.textAlignment = .center
        shareTextLbl.textColor = UIColor.white
        shareTextLbl.translatesAutoresizingMaskIntoConstraints = false
        shareTextLbl.centerXAnchor.constraint(equalTo: shareTextBtn.centerXAnchor).isActive = true
        shareTextLbl.centerYAnchor.constraint(equalTo: shareTextBtn.centerYAnchor).isActive = true
        shareTextLbl.widthAnchor.constraint(equalTo: shareTextBtn.widthAnchor, multiplier: 1.0).isActive = true
        shareTextLbl.heightAnchor.constraint(equalTo: shareTextBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        return shareView
    }
    
    func closeShareBtnPressed() {
        self.shareView.isHidden = true
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if blurShown {
            blurEffectView.isHidden = true
            blurShown = false
        }
    }
    
    
    func closeFilterBtnPressed() {
        self.filterView.isHidden = true
        
    }

    
    // Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = manager.location
        manager.stopUpdatingLocation()
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(currentLocation!) { (placemark, error) in
            let placemark = placemark?.first
            let mutableString = NSMutableAttributedString()
            
            self.locationLbl.attributedText = mutableString
            
            if error != nil {
                
            }
            else {
                
                UserDefaults.standard.set(placemark?.thoroughfare, forKey: "CurrentLocation")
                
                let location = placemark?.thoroughfare
                
                /*
                
                let textAttachment = NSTextAttachment()
                textAttachment.image = UIImage(named: "profile_location_ic")
                textAttachment.bounds = CGRect(x: self.locationLbl.frame.minX, y: self.locationLbl.frame.minY, width: 18, height: 28)
                
                let attributedString = NSAttributedString(attachment: textAttachment)
                
                let locationAttributed = NSAttributedString(string: location!)
                
                mutableString.append(attributedString)
                mutableString.append(locationAttributed)
                */
                
                self.locationLbl.text = location
            }
            // Update location field
            print(mutableString)
        }
    }
    
    // Facebook Info
    
    func getFacebookUserInfo() {
        
        if(FBSDKAccessToken.current() != nil) {
            print(FBSDKAccessToken.current().permissions)
            
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            
            let connection = FBSDKGraphRequestConnection()
            
            connection.add(graphRequest, completionHandler: { (connection, result, error) -> Void in
                let data = result as! [String : AnyObject]
                
                self.nameLbl.text = data["name"] as? String
                
                let fBid = data["id"] as? String
                
                let url = NSURL(string: "https://graph.facebook.com/\(fBid!)/picture?type=large&return_ssl_resources=1")
                
                self.imageView.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
            })
                connection.start()
        }
    
    }
    
    // Google Info
    
    func getGoogleUserInfo() {
        if let user = GIDSignIn.sharedInstance().currentUser {
            let userName = user.profile.givenName
            let imageURL = user.profile.imageURL(withDimension: 2000) // size of icon
            
            self.nameLbl.text = userName
            self.imageView.image = UIImage(data: NSData(contentsOf: imageURL! as URL)! as Data)
        }
        else {
            // no google user signed in
        }
    }
    
    // LinkedIn Info
    
    func getLinkedInInfo() {
        if let accessToken = UserDefaults.standard.object(forKey: "LIAccessToken") as? String {

            // Specify the URL string that we'll get the profile info from.
            let targetURLString = "https://api.linkedin.com/v1/people/~?format=json"
            
            // Initialize a mutable URL request object.
            let request = NSMutableURLRequest(url: URL(string: targetURLString)!)
            
            // Indicate that this is a GET request.
            request.httpMethod = "GET"
            
            // Add the access token as an HTTP header field.
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            // Initialize a NSURLSession object.
            let session = URLSession(configuration: URLSessionConfiguration.default)
            
            // Make the request.
            let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                // Get the HTTP status code of the request.
                let statusCode = (response as! HTTPURLResponse).statusCode
                
                if statusCode == 200 {
                    // Convert the received JSON data into a dictionary.
                    do {
                        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        
                        print(dataDictionary)
                        
                        let firstName = dataDictionary?["firstName"] as? String
                        let lastName = dataDictionary?["lastName"] as? String
                        
                        DispatchQueue.main.async(execute: { () -> Void in
                            self.nameLbl.text = "\(firstName ?? "") \(lastName ?? "")"
                            self.getLinkedInImage(accessToken: accessToken)
                        })
                    }
                    catch {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func getLinkedInImage(accessToken: String) {
        // Specify the URL string that we'll get the profile info from.
        let targetURLString = "https://api.linkedin.com/v1/people/~:(id,num-connections,picture-url)?format=json"
        
        // Initialize a mutable URL request object.
        let request = NSMutableURLRequest(url: URL(string: targetURLString)!)
        
        // Indicate that this is a GET request.
        request.httpMethod = "GET"
        
        // Add the access token as an HTTP header field.
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        // Initialize a NSURLSession object.
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        // Make the request.
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            // Get the HTTP status code of the request.
            let statusCode = (response as! HTTPURLResponse).statusCode
            
            if statusCode == 200 {
                // Convert the received JSON data into a dictionary.
                do {
                    let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                    
                    var imageURL: URL?
                    
                    print(dataDictionary)
                    
                    if let pictureURL = dataDictionary?["pictureUrl"] as? String {
                        let url = URL(string: pictureURL)
                        imageURL = url
                    }
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        if let dataURL = imageURL {
                            let imageData = NSData(contentsOf: dataURL)
                            let profileImage = UIImage(data: imageData! as Data)
                            self.imageView.image = profileImage
                        }
                        else {
                            self.imageView.image = UIImage(named: "profile_ic")
                            self.imageView.contentMode = .scaleAspectFit
                        }
                    })
                }
                catch {
                    print("Could not convert JSON data into a dictionary.")
                }
            }
        }
        task.resume()
    }

    
    func returnUserProfileImage(accessToken: NSString) {
        
        var userID = accessToken as NSString
        var facebookProfileUrl = NSURL(string: "http://graph.facebook.com/\(userID)/picture?type=large")
        
        if let data = NSData(contentsOf: facebookProfileUrl as! URL) {
            imageView.image = UIImage(data: data as Data)
        }
    }
    
    
    
}
