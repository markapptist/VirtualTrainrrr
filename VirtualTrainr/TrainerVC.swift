//
//  TrainerVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-27.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerVC: UIViewController {
    
    let backgroundImgView = UIImageView()
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    
    let topView = UIView()
    
    let tabView = UIView()
    
    let tabBtn1 = UIButton()
    
    let tabBtn2 = UIButton()
    
    let tabSwitch = UISegmentedControl()
    
    let containerView = UIView()
    
    let infoView = UIView()
    
    let nameLbl = UILabel()
    
    let locationLbl = UILabel()
    
    let verifiedLbl = UILabel()
    
    let exitBtn = UIButton()
    
    let trainerAboutMe = TrainerAboutMeSegmentVC()
    
    let trainerReviews = TrainerReviewSegmentVC()
    
    let sessions = TrainerSessionsSegmentVC()
    
    let packages = TrainerPackageSegmentVC()
    
    let settingsTab = SettingsSegmentVC()
    
    let verificationTab = VerificationSegmentVC()
    
    let shareView = UIView()
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!
    
    let facebookSym = UIImageView()
    let emailSym = UIImageView()
    let phoneSym = UIImageView()
    let googleSym = UIImageView()
    let linkedInSym = UIImageView()
    let cardSym = UIImageView()
    
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    
    let goldStar = #imageLiteral(resourceName: "full_star")
    let emptyStar = #imageLiteral(resourceName: "empty_star")
    
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
        
        // Do any additional setup after loading the view.
        
        self.view.addSubview(backgroundImgView)
        backgroundImgView.image = #imageLiteral(resourceName: "bicep")
        backgroundImgView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImgView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        backgroundImgView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35).isActive = true
        backgroundImgView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImgView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(exitBtn)
        exitBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        exitBtn.translatesAutoresizingMaskIntoConstraints = false
        exitBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        exitBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        exitBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        exitBtn.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 10).isActive = true
        exitBtn.addTarget(self, action: #selector(exitBtnPressed), for:.touchUpInside)
        
        tabView.backgroundColor = UIColor.black
        self.view.addSubview(tabView)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        tabView.topAnchor.constraint(equalTo: backgroundImgView.bottomAnchor, constant: 0).isActive = true
        tabView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        tabView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        tabView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(tabBtn1)
        tabBtn1.translatesAutoresizingMaskIntoConstraints = false
        tabBtn1.leadingAnchor.constraint(equalTo: tabView.leadingAnchor).isActive = true
        tabBtn1.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        tabBtn1.heightAnchor.constraint(equalTo: tabView.heightAnchor, multiplier: 1.0).isActive = true
        tabBtn1.widthAnchor.constraint(equalTo: tabView.widthAnchor, multiplier: 0.5).isActive = true
        tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic_white.png"), for: .normal)
        tabBtn1.addTarget(self, action: #selector(tabBtn1Pressed), for: .touchUpInside)
        
        self.view.addSubview(tabBtn2)
        tabBtn2.translatesAutoresizingMaskIntoConstraints = false
        tabBtn2.leadingAnchor.constraint(equalTo: tabBtn1.trailingAnchor).isActive = true
        tabBtn2.topAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        tabBtn2.heightAnchor.constraint(equalTo: tabView.heightAnchor, multiplier: 1.0).isActive = true
        tabBtn2.widthAnchor.constraint(equalTo: tabView.widthAnchor, multiplier: 0.5).isActive = true
        tabBtn2.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
        tabBtn2.addTarget(self, action: #selector(tabBtn2Pressed), for: .touchUpInside)
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.darkGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.tabView.bottomAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        tabSwitch.makeRound()
        self.view.addSubview(tabSwitch)
        tabSwitch.tintColor = UIColor.lightGray
        tabSwitch.insertSegment(withTitle: " ", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: " ", at: 1, animated: true)
        tabSwitch.insertSegment(withTitle: " ", at: 2, animated: true)
        
        tabSwitch.isEnabledForSegment(at: 0)
        tabSwitch.isEnabledForSegment(at: 1)
        tabSwitch.isEnabledForSegment(at: 2)
        tabSwitch.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        tabSwitch.translatesAutoresizingMaskIntoConstraints = false
        tabSwitch.topAnchor.constraint(equalTo: tabView.bottomAnchor, constant: 10).isActive = true
        tabSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabSwitch.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        tabSwitch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        self.view.addSubview(infoView)
        infoView.backgroundColor = UIColor.init(red: 57/255, green: 85/255, blue: 142/255, alpha: 1.0)
        infoView.alpha = 0.9
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        infoView.heightAnchor.constraint(equalTo: self.backgroundImgView.heightAnchor, multiplier: 0.5).isActive = true
        infoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: tabView.topAnchor).isActive = true
        
        self.view.addSubview(imageView)
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "sample_image.png")
        imageView.contentMode = .scaleAspectFit
        imageView.makeRound()
        imageView.addBorder(width: 5, color: UIColor.init(red: 66/255, green: 122/255, blue: 160/255, alpha: 0.8).cgColor)
        imageView.centerYAnchor.constraint(equalTo: infoView.centerYAnchor, constant: -60).isActive = true
        imageView.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        let emailIconBtn = UIButton()
        self.view.addSubview(emailIconBtn)
        emailIconBtn.setImage(#imageLiteral(resourceName: "verify_email_btn"), for: .normal)
        emailIconBtn.translatesAutoresizingMaskIntoConstraints = false
        emailIconBtn.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30).isActive = true
        emailIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        emailIconBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        emailIconBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let verifyIconBtn = UIButton()
        self.view.addSubview(verifyIconBtn)
        verifyIconBtn.setImage(#imageLiteral(resourceName: "profile_verify_btn"), for: .normal)
        verifyIconBtn.translatesAutoresizingMaskIntoConstraints = false
        verifyIconBtn.leadingAnchor.constraint(equalTo: emailIconBtn.trailingAnchor, constant: 15).isActive = true
        verifyIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        verifyIconBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        verifyIconBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let shareIconBtn = UIButton()
        self.view.addSubview(shareIconBtn)
        shareIconBtn.setImage(#imageLiteral(resourceName: "profile_share_btn"), for: .normal)
        shareIconBtn.translatesAutoresizingMaskIntoConstraints = false
        shareIconBtn.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30).isActive = true
        shareIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        shareIconBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.addTarget(self, action: #selector(makeShareView), for: .touchUpInside)
        
        let likeIconBtn = UIButton()
        self.view.addSubview(likeIconBtn)
        likeIconBtn.setImage(#imageLiteral(resourceName: "profile_fab_btn"), for: .normal)
        likeIconBtn.translatesAutoresizingMaskIntoConstraints = false
        likeIconBtn.leadingAnchor.constraint(equalTo: shareIconBtn.trailingAnchor, constant: 15).isActive = true
        likeIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        likeIconBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        likeIconBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(nameLbl)
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.text = "Jane Smith"
        nameLbl.font = UIFont(name: "SFUIText-Regular", size: 16)
        nameLbl.textAlignment = .center
        nameLbl.textColor = UIColor.white
        nameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        nameLbl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        nameLbl.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 2.0).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: infoView.heightAnchor, multiplier: 0.2).isActive = true
        
        let verified = UILabel()
        self.view.addSubview(verified)
        verified.translatesAutoresizingMaskIntoConstraints = false
        verified.text = "Verified"
        verified.font = UIFont(name: "SFUIText-Light", size: 14)
        verified.textAlignment = .left
        verified.textColor = UIColor.white
        verified.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -10).isActive = true
        verified.widthAnchor.constraint(equalTo: nameLbl.widthAnchor, multiplier: 0.3).isActive = true
        verified.centerXAnchor.constraint(equalTo: nameLbl.centerXAnchor, constant: -70).isActive = true
        verified.heightAnchor.constraint(equalTo: nameLbl.heightAnchor, multiplier: 1.0).isActive = true
        
        
        let locationIcon = UIImageView()
        locationIcon.image = #imageLiteral(resourceName: "profile_location_ic.png")
        self.infoView.addSubview(locationIcon)
        
        
        locationLbl.font = UIFont(name: "SFUIText-Regular", size: 12)
        locationLbl.text = "5 km away"
        locationLbl.adjustsFontSizeToFitWidth = true
        locationLbl.textAlignment = .center
        locationLbl.textColor = UIColor.white
        self.infoView.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 10).isActive = true
        locationLbl.centerYAnchor.constraint(equalTo: self.infoView.centerYAnchor, constant: 0).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.infoView.widthAnchor, multiplier: 0.2).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.infoView.heightAnchor, multiplier: 0.2).isActive = true
        
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor, constant: 30).isActive = true
        locationIcon.centerYAnchor.constraint(equalTo: self.locationLbl.centerYAnchor).isActive = true
        locationIcon.widthAnchor.constraint(equalTo: self.locationLbl.widthAnchor, multiplier: 0.11).isActive = true
        locationIcon.heightAnchor.constraint(equalTo: self.locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        self.view.addSubview(facebookSym)
        facebookSym.image = #imageLiteral(resourceName: "facebook_verify_ic.png")
        facebookSym.translatesAutoresizingMaskIntoConstraints = false
        facebookSym.leadingAnchor.constraint(equalTo: verified.trailingAnchor, constant: 3).isActive = true
        facebookSym.centerYAnchor.constraint(equalTo: verified.centerYAnchor).isActive = true
        facebookSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        facebookSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(emailSym)
        emailSym.image = #imageLiteral(resourceName: "verify_email_btn")
        emailSym.translatesAutoresizingMaskIntoConstraints = false
        emailSym.leadingAnchor.constraint(equalTo: facebookSym.trailingAnchor, constant: 3).isActive = true
        emailSym.centerYAnchor.constraint(equalTo: verified.centerYAnchor).isActive = true
        emailSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(phoneSym)
        phoneSym.image = #imageLiteral(resourceName: "profile_verify_btn")
        phoneSym.translatesAutoresizingMaskIntoConstraints = false
        phoneSym.leadingAnchor.constraint(equalTo: emailSym.trailingAnchor, constant: 3).isActive = true
        phoneSym.centerYAnchor.constraint(equalTo: verified.centerYAnchor).isActive = true
        phoneSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        phoneSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(googleSym)
        googleSym.image = #imageLiteral(resourceName: "gmail_verify_ic.png")
        googleSym.translatesAutoresizingMaskIntoConstraints = false
        googleSym.leadingAnchor.constraint(equalTo: phoneSym.trailingAnchor, constant: 3).isActive = true
        googleSym.centerYAnchor.constraint(equalTo: verified.centerYAnchor).isActive = true
        googleSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        googleSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.view.addSubview(linkedInSym)
        linkedInSym.image = #imageLiteral(resourceName: "gmail_verify_ic.png")
        linkedInSym.translatesAutoresizingMaskIntoConstraints = false
        linkedInSym.leadingAnchor.constraint(equalTo: googleSym.trailingAnchor, constant: 3).isActive = true
        linkedInSym.centerYAnchor.constraint(equalTo: verified.centerYAnchor).isActive = true
        linkedInSym.widthAnchor.constraint(equalToConstant: 20).isActive = true
        linkedInSym.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        star1.image = goldStar
        star1.contentMode = .scaleAspectFit
        self.view.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: self.nameLbl.trailingAnchor, constant: 10).isActive = true
        star1.centerYAnchor.constraint(equalTo: self.nameLbl.centerYAnchor, constant: 0).isActive = true
        star1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        star2.image = goldStar
        star2.contentMode = .scaleAspectFit
        self.view.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 0).isActive = true
        star2.centerYAnchor.constraint(equalTo: self.nameLbl.centerYAnchor, constant: 0).isActive = true
        star2.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        star3.image = goldStar
        star3.contentMode = .scaleAspectFit
        self.view.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 0).isActive = true
        star3.centerYAnchor.constraint(equalTo: self.nameLbl.centerYAnchor, constant: 0).isActive = true
        star3.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star3.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        star4.image = goldStar
        star4.contentMode = .scaleAspectFit
        self.view.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 0).isActive = true
        star4.centerYAnchor.constraint(equalTo: self.nameLbl.centerYAnchor, constant: 0).isActive = true
        star4.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star4.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        star5.image = emptyStar
        star5.contentMode = .scaleAspectFit
        self.view.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 0).isActive = true
        star5.centerYAnchor.constraint(equalTo: self.nameLbl.centerYAnchor, constant: 0).isActive = true
        star5.widthAnchor.constraint(equalToConstant: 10).isActive = true
        star5.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.isHidden = true

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
            tabBtn1.backgroundColor = UIColor.darkGray
            tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic.png"), for: .normal)
            tabBtn1.isSelected = true
            
            tabSwitch.selectedSegmentIndex = 0
            
            if tabSwitch.numberOfSegments == 2 {
                
                tabSwitch.insertSegment(withTitle: "Reviews", at: 2, animated: true)
                
            }
            
            tabSwitch.setTitle("My Clients", forSegmentAt: 0)
            tabSwitch.setTitle("About Me", forSegmentAt: 1)
            tabSwitch.setTitle("Reviews", forSegmentAt: 2)
            
        }
        
        if tabBtn2.isSelected {
            tabBtn2.backgroundColor = UIColor.black
            tabBtn2.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
            tabBtn2.isSelected = false
        }
        
        indexChanged()
        
    
    }
    
    func tabBtn2Pressed() {
        
        tabSwitch.isHidden = false
        
        
        if !tabBtn2.isSelected {
            tabBtn2.backgroundColor = UIColor.darkGray
            tabBtn2.setImage(#imageLiteral(resourceName: "settings_ic.png"), for: .normal)
            tabBtn2.isSelected = true
            
            tabSwitch.selectedSegmentIndex = 0
            
            tabSwitch.setTitle("Settings", forSegmentAt: 0)
            tabSwitch.setTitle("Verification", forSegmentAt: 1)
            
            if tabSwitch.numberOfSegments > 2 {
                
                tabSwitch.removeSegment(at: 2, animated: true)
                
            }
          
        }
        
        if tabBtn1.isSelected {
            tabBtn1.backgroundColor = UIColor.black
            tabBtn1.setImage(#imageLiteral(resourceName: "profile_ic.png"), for: .normal)
            tabBtn1.isSelected = false
        }
        
        indexChanged()
   
    }
    
    func indexChanged() {
        
        if tabBtn1.isSelected {
            
            sessions.view.isHidden = true
            packages.view.isHidden = true
            settingsTab.view.isHidden = true
            verificationTab.view.isHidden = true
            
                switch tabSwitch.selectedSegmentIndex {
            case 0:
                print("my clients")
            
             
            case 1:
                print("my trainers")
                trainerAboutMe.view.frame = containerView.bounds
                self.addChildViewController(trainerAboutMe)
                containerView.addSubview(trainerAboutMe.view)
                    
                if(trainerAboutMe.isViewLoaded) {
                    
                    if(trainerAboutMe.view.isHidden) {
                        trainerAboutMe.view.isHidden = false
                    }
                    
                    trainerReviews.view.isHidden = true
                    
                    }
                    
            case 2:
                print("my trainers")
                trainerReviews.view.frame = containerView.bounds
                self.addChildViewController(trainerReviews)
                containerView.addSubview(trainerReviews.view)
                
                if(trainerReviews.isViewLoaded) {
                    
                    if(trainerReviews.view.isHidden) {
                        trainerReviews.view.isHidden = false
                    }
                        
                    trainerAboutMe.view.isHidden = true
                        
                }
                    
            default:
                break
            }
            
        }
        
        if tabBtn2.isSelected {
            
            trainerReviews.view.isHidden = true
            trainerAboutMe.view.isHidden = true
            settingsTab.view.isHidden = true
            verificationTab.view.isHidden = true
            
                switch tabSwitch.selectedSegmentIndex {
            case 0:
                print("profile tab")
                settingsTab.view.frame = containerView.bounds
                self.addChildViewController(settingsTab)
                containerView.addSubview(settingsTab.view)
                    
                if(settingsTab.isViewLoaded) {
                    
                    if(settingsTab.view.isHidden) {
                        settingsTab.view.isHidden = false
                    }
                    
                    verificationTab.view.isHidden = true
                    
                }
  
            case 1:
                print("my trainers")
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


    func exitBtnPressed() {
        
   
        self.tabBarController?.selectedIndex = 0
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
