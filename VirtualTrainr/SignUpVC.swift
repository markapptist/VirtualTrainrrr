//
//  LogInVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class SignUpVC: RegisterVC, GIDSignInUIDelegate {
    
    let facebookBtn = UIButton()
    let registerBtn = UIButton()
    let linkedInBtn = UIButton()
    let googleBtn = UIButton()
    
    let faceBookLbl = UILabel()
    let registerLbl = UILabel()
    let linkedInLbl = UILabel()
    let googleLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: signedInNotification, object: nil, queue: nil, using: presentDashboard(notification:))
        
        self.pageControl.numberOfPages = 2
        
        facebookBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        linkedInBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(facebookBtn)
        self.view.addSubview(registerBtn)
        self.view.addSubview(linkedInBtn)
        self.view.addSubview(googleBtn)
        
        
      //  facebookBtn.setTitle("Register with Facebook", for: .normal)
        facebookBtn.setImage(#imageLiteral(resourceName: "facebook_ic.png"), for: .normal)
        facebookBtn.imageView?.contentMode = .scaleAspectFit
        facebookBtn.titleLabel?.contentMode = .right
        facebookBtn.layer.cornerRadius = 30
        facebookBtn.backgroundColor = UIColor.lightText
        facebookBtn.layer.borderWidth = 1
        facebookBtn.layer.borderColor = UIColor.lightGray.cgColor
        facebookBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        facebookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        facebookBtn.topAnchor.constraint(equalTo: (self.subTitleLbl?.bottomAnchor)!, constant: 60).isActive = true
        facebookBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        facebookBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        facebookBtn.addTarget(self, action: #selector(facebookbtnPressed), for: .touchUpInside)

        
     //   googleBtn.setTitle("Register with Google", for: .normal)
        googleBtn.setImage(#imageLiteral(resourceName: "googe_ic.png"), for: .normal)
        googleBtn.layer.cornerRadius = 30
        googleBtn.titleLabel?.textAlignment = .right
        googleBtn.imageView?.contentMode = .scaleAspectFit
        googleBtn.backgroundColor = UIColor.clear
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = UIColor.lightGray.cgColor
        googleBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        googleBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleBtn.topAnchor.constraint(equalTo: self.facebookBtn.bottomAnchor, constant: 20).isActive = true
        googleBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        googleBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        googleBtn.addTarget(self, action: #selector(googlebtnPressed), for: .touchUpInside)
        googleBtn.isUserInteractionEnabled = false 
        
        //   linkedInBtn.setTitle("Register with LinkedIn", for: .normal)
        linkedInBtn.setImage(#imageLiteral(resourceName: "linkedin_ic.png"), for: .normal)
        linkedInBtn.layer.cornerRadius = 30
        linkedInBtn.titleLabel?.textAlignment = .right
        linkedInBtn.imageView?.contentMode = .scaleAspectFit
        linkedInBtn.backgroundColor = UIColor.clear
        linkedInBtn.layer.borderWidth = 1
        linkedInBtn.layer.borderColor = UIColor.lightGray.cgColor
        linkedInBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        linkedInBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        linkedInBtn.topAnchor.constraint(equalTo: self.googleBtn.bottomAnchor, constant: 20).isActive = true
        linkedInBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        linkedInBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        linkedInBtn.addTarget(self, action: #selector(linkedInbtnPressed), for: .touchUpInside)
        
        
        //  registerBtn.setTitle("Register with Email", for: .normal)
        registerBtn.setImage(#imageLiteral(resourceName: "mail_ic.png"), for: .normal)
        registerBtn.layer.cornerRadius = 30
        registerBtn.titleLabel?.textAlignment = .right
        registerBtn.imageView?.contentMode = .scaleAspectFit
        registerBtn.backgroundColor = UIColor.clear
        registerBtn.layer.borderWidth = 1
        registerBtn.layer.borderColor = UIColor.lightGray.cgColor
        registerBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        registerBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        registerBtn.topAnchor.constraint(equalTo: self.linkedInBtn.bottomAnchor, constant: 20).isActive = true
        registerBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        registerBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        registerBtn.addTarget(self, action: #selector(emailbtnPressed), for: .touchUpInside)

        facebookBtn.addSubview(faceBookLbl)
        registerBtn.addSubview(registerLbl)
        linkedInBtn.addSubview(linkedInLbl)
        googleBtn.addSubview(googleLbl)
        
        faceBookLbl.translatesAutoresizingMaskIntoConstraints = false
        registerLbl.translatesAutoresizingMaskIntoConstraints = false
        linkedInLbl.translatesAutoresizingMaskIntoConstraints = false
        googleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        faceBookLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        faceBookLbl.text = "Continue With Facebook"
        faceBookLbl.textAlignment = .center
        faceBookLbl.textColor = UIColor.white
        faceBookLbl.centerXAnchor.constraint(equalTo: facebookBtn.centerXAnchor).isActive = true
        faceBookLbl.centerYAnchor.constraint(equalTo: facebookBtn.centerYAnchor).isActive = true
        faceBookLbl.widthAnchor.constraint(equalTo: facebookBtn.widthAnchor, multiplier: 0.7).isActive = true
        faceBookLbl.heightAnchor.constraint(equalTo: facebookBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        registerLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        registerLbl.text = "Register With Email"
        registerLbl.textAlignment = .center
        registerLbl.textColor = UIColor.white
        registerLbl.centerXAnchor.constraint(equalTo: registerBtn.centerXAnchor).isActive = true
        registerLbl.centerYAnchor.constraint(equalTo: registerBtn.centerYAnchor).isActive = true
        registerLbl.widthAnchor.constraint(equalTo: registerBtn.widthAnchor, multiplier: 0.7).isActive = true
        registerLbl.heightAnchor.constraint(equalTo: registerBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        linkedInLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        linkedInLbl.text = "Register With LinkedIn"
        linkedInLbl.textAlignment = .center
        linkedInLbl.textColor = UIColor.white
        linkedInLbl.centerXAnchor.constraint(equalTo: linkedInBtn.centerXAnchor).isActive = true
        linkedInLbl.centerYAnchor.constraint(equalTo: linkedInBtn.centerYAnchor).isActive = true
        linkedInLbl.widthAnchor.constraint(equalTo: linkedInBtn.widthAnchor, multiplier: 1.0).isActive = true
        linkedInLbl.heightAnchor.constraint(equalTo: linkedInBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        googleLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        googleLbl.text = "Register With Google"
        googleLbl.textAlignment = .center
        googleLbl.textColor = UIColor.white
        googleLbl.centerXAnchor.constraint(equalTo: googleBtn.centerXAnchor).isActive = true
        googleLbl.centerYAnchor.constraint(equalTo: googleBtn.centerYAnchor).isActive = true
        googleLbl.widthAnchor.constraint(equalTo: googleBtn.widthAnchor, multiplier: 1.0).isActive = true
        googleLbl.heightAnchor.constraint(equalTo: googleBtn.heightAnchor, multiplier: 1.0).isActive = true
    
        titleLbl.text = "Register"
        subTitleLbl?.isHidden = false
        subTitleLbl?.text = "Please select an option below to register"
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentDashboard(notification: Notification) {
    
        self.present(AppContainerViewController(), animated: true, completion: nil)
        
    }
    
    func emailbtnPressed() {
        let vc = LogInWithEmailVC()
        present(vc, animated: true, completion: nil)
    }
   
    func googlebtnPressed() {
        
        GIDSignIn.sharedInstance().signIn()
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        UserDefaults.standard.set(true, forKey: "googleCheck")

    }
    
   
    func linkedInbtnPressed() {
        let vc = WebViewController()
        present(vc, animated: true, completion: nil)
    }
    
    func facebookbtnPressed() {
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self) { (result, err) in
            
            if result?.grantedPermissions != nil {
                self.present(MyDashboard(), animated: true, completion: nil)
                self.showEmailAddress()
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                UserDefaults.standard.set(true, forKey: "facebookCheck")

            }
            
            if err != nil {
                print("Custom FB Login Failed:", err)
                return
            }
            
        }
    }
    
    func showEmailAddress() {
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            
            print(result)
            
        }
    }

}
