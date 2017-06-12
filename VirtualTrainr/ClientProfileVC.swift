//
//  ClientProfileVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ClientProfileVC: UIViewController {
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    let topView = UIView()
    
    let nameLbl = UILabel()
    
    let locationLbl = UILabel()
    
    let verifiedLbl = UILabel()
    
    let containerView = UIView()

    let profileTab = ClientProfileSegmentVC()
    
    let facebookSym = UIImageView()
    let emailSym = UIImageView()
    let phoneSym = UIImageView()
    let googleSym = UIImageView()
    let linkedInSym = UIImageView()
    let cardSym = UIImageView()
    
    let closeBtn = UIButton()
    
    let shareView = UIView()
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!

    
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
        
        self.view.addSubview(containerView)
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        profileTab.view.frame = containerView.bounds
        self.addChildViewController(profileTab)
        containerView.addSubview(profileTab.view)

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
        
        let shareIconBtn = UIButton()
        self.view.addSubview(shareIconBtn)
        shareIconBtn.setImage(#imageLiteral(resourceName: "profile_share_btn"), for: .normal)
        shareIconBtn.translatesAutoresizingMaskIntoConstraints = false
        shareIconBtn.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30).isActive = true
        shareIconBtn.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0).isActive = true
        shareIconBtn.widthAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shareIconBtn.addTarget(self, action: #selector(makeShareView), for: .touchUpInside)

    }
    
    func closeBtnPressed() {
        
           self.dismiss(animated: true, completion: nil)
        
        //   NotificationCenter.default.post(name: closeNotification, object: nil, userInfo: nil)
        
        self.tabBarController?.selectedIndex = 0
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

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
