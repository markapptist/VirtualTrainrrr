    //
    //  LogInWithEmailVC.swift
    //  VirtualTrainr
    //
    //  Created by Mark Meritt on 2017-03-31.
    //  Copyright © 2017 Apptist. All rights reserved.
    //
    
    import UIKit
    
    protocol AuthenticateStatus {
        func didCompleteLogin()
        func didCompleteTrainer()
        func login()
    }
    
    class LogInWithEmailVC: LogInVC, UITextFieldDelegate {
        
        let emailTextField = UITextField()
        let passwordTextField = UITextField()
        
        let emailUnderView = UIView()
        let passwordUnderView = UIView()
        
        
        let mailIcon = UIImageView()
        let passIcon = UIImageView()
        
        let continueBtn = UIButton()
        let continueLbl = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            DataService.instance.authDelegate = self
            
            self.pageControl.currentPage = 1
            
            self.titleLbl.text = "Almost there!"
            self.subTitleLbl?.text = "Log in to save your settings!"
            
            self.linkedInBtn.removeFromSuperview()
            self.linkedInLbl.removeFromSuperview()
            self.googleBtn.removeFromSuperview()
            self.googleLbl.removeFromSuperview()
            self.registerBtn.removeFromSuperview()
            self.registerLbl.removeFromSuperview()
            self.faceBookLbl.removeFromSuperview()
            self.facebookBtn.removeFromSuperview()
            
            self.view.addSubview(emailTextField)
            self.view.addSubview(passwordTextField)
            
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            
            
            emailTextField.placeholder = "Enter email"
            emailTextField.backgroundColor = UIColor.clear
            emailTextField.textColor = UIColor.white
            emailTextField.font = standardFont
            emailTextField.topAnchor.constraint(equalTo: (self.subTitleLbl?.bottomAnchor)!, constant: 20).isActive = true
            emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
            emailTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
            
            emailUnderView.backgroundColor = UIColor.white
            self.view.addSubview(emailUnderView)
            emailUnderView.translatesAutoresizingMaskIntoConstraints = false
            emailUnderView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor).isActive = true
            emailUnderView.centerXAnchor.constraint(equalTo: self.emailTextField.centerXAnchor).isActive = true
            emailUnderView.widthAnchor.constraint(equalTo: self.emailTextField.widthAnchor).isActive = true
            emailUnderView.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor, multiplier: 0.01).isActive = true
            
            
            passwordTextField.placeholder = "Enter password"
            passwordTextField.textColor = UIColor.white
            passwordTextField.isSecureTextEntry = true
            passwordTextField.font = standardFont
            passwordTextField.backgroundColor = UIColor.clear
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20).isActive = true
            passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            passwordTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7).isActive = true
            passwordTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
            
            passwordUnderView.backgroundColor = UIColor.white
            self.view.addSubview(passwordUnderView)
            passwordUnderView.translatesAutoresizingMaskIntoConstraints = false
            passwordUnderView.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor).isActive = true
            passwordUnderView.centerXAnchor.constraint(equalTo: self.passwordTextField.centerXAnchor).isActive = true
            passwordUnderView.widthAnchor.constraint(equalTo: self.passwordTextField.widthAnchor).isActive = true
            passwordUnderView.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor, multiplier: 0.01).isActive = true
            
            
            mailIcon.image = #imageLiteral(resourceName: "mail_ic.png")
            self.view.addSubview(mailIcon)
            self.mailIcon.contentMode = .scaleAspectFit
            self.mailIcon.translatesAutoresizingMaskIntoConstraints = false
            self.mailIcon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
            self.mailIcon.centerYAnchor.constraint(equalTo: self.emailTextField.centerYAnchor).isActive = true
            self.mailIcon.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
            self.mailIcon.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor, multiplier: 0.4).isActive = true
            
            passIcon.image = #imageLiteral(resourceName: "password_ic.png")
            self.view.addSubview(passIcon)
            self.passIcon.contentMode = .scaleAspectFit
            self.passIcon.translatesAutoresizingMaskIntoConstraints = false
            self.passIcon.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
            self.passIcon.centerYAnchor.constraint(equalTo: self.passwordTextField.centerYAnchor).isActive = true
            self.passIcon.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.1).isActive = true
            self.passIcon.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor, multiplier: 0.4).isActive = true
            
            self.view.addSubview(continueBtn)
            continueBtn.translatesAutoresizingMaskIntoConstraints = false
            continueBtn.backgroundColor = UIColor.white
            continueBtn.alpha = 0.2
            continueBtn.layer.cornerRadius = 30
            continueBtn.titleLabel?.font = standardFont
            continueBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
            continueBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
            continueBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
            continueBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
            continueBtn.addTarget(self, action: #selector(continueBtnPressed), for: .touchUpInside)
            
            self.view.addSubview(continueLbl)
            
            continueLbl.translatesAutoresizingMaskIntoConstraints = false
            continueLbl.text = "Continue"
            continueLbl.font = standardFont
            continueLbl.textAlignment = .center
            continueLbl.textColor = UIColor.white
            continueLbl.centerXAnchor.constraint(equalTo: continueBtn.centerXAnchor).isActive = true
            continueLbl.centerYAnchor.constraint(equalTo: continueBtn.centerYAnchor).isActive = true
            continueLbl.widthAnchor.constraint(equalTo: continueBtn.widthAnchor).isActive = true
            continueLbl.heightAnchor.constraint(equalTo: continueBtn.heightAnchor).isActive = true
            
        }
        
        func continueBtnPressed() {
            
            if(!(emailTextField.text?.isBlank)!) {
                if(!(passwordTextField.text?.isBlank)!) {
                    if (UserDefaults.standard.bool(forKey: "emailLogin")) {
                        AuthService.instance.login(email: emailTextField.text!, password: passwordTextField.text!, onComplete: nil)
                        AuthService.instance.authDelegate = self
                        DataService.instance.authDelegate = self
                    }
                    else {
                        AuthService.instance.login(email: emailTextField.text!, password: passwordTextField.text!, onComplete: nil)
                        AuthService.instance.authDelegate = self
                        DataService.instance.authDelegate = self
                    }
                }
            }
            /*
             _ = validate(showError: true)
             
             if(!validate(showError: true)) {
             return
             } else {
             AuthService.instance.login(email: self.emailTextField.textField.text!, password: self.passwordTextField.textField.text!) {
             Completion in
             
             if(Completion.0 == nil) {
             
             } else {
             ErrorHandler.sharedInstance.show(message: Completion.0!, container: self)
             
             }
             }
             }
             
             */
        }
        /*
         func validate(showError: Bool) -> Bool {
         ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
         if(!emailTextField.validate()) {
         if(showError) {
         if(emailTextField.validationError == "blank") {
         ErrorHandler.sharedInstance.show(message: "Email Field Cannot Be Blank", container: self)
         }
         if(emailTextField.validationError == "not_email") {
         ErrorHandler.sharedInstance.show(message: "You should double-check that email address....", container: self)
         }
         }
         return false
         }
         
         if(!passwordTextField.validate()) {
         if(showError) {
         if(passwordTextField.validationError == "blank") {
         ErrorHandler.sharedInstance.show(message: "Password Field Cannot Be Blank", container: self)
         }
         }
         return false
         }
         return true
         }
         */
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.resignFirstResponder()
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
        
    }
    
    extension LogInWithEmailVC: AuthenticateStatus {
        func didCompleteLogin() {
            let dashboard = MyDashboard()
            UserDefaults.standard.set(true, forKey: "emailLogin")
            self.present(dashboard, animated: true, completion: nil)
        }
        
        func didCompleteTrainer() {
            let dashboard = MyDashboard()
            NotificationCenter.default.post(name: switchToTrainerPortal, object: nil, userInfo: nil)
            self.present(dashboard, animated: true, completion: nil)
        }
        func login() {
            let dashboard = MyDashboard()
            self.present(dashboard, animated: true, completion: nil)
        }
    }
