//
//  VerificationSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class VerificationSegmentVC: UIViewController {
    
    let scrollView = UIScrollView()
    
    let facebookBtn = UIButton()
    let linkedInBtn = UIButton()
    let googleBtn = UIButton()
    
    let faceBookLbl = UILabel()
    let linkedInLbl = UILabel()
    let googleLbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 1.0)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        
        let phoneNumberLbl = UILabel()
        phoneNumberLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        phoneNumberLbl.text = "Phone Number"
        
        self.scrollView.addSubview(phoneNumberLbl)
        phoneNumberLbl.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        phoneNumberLbl.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        phoneNumberLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        phoneNumberLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        
        let verifyPhoneView = makeRoundedViewRight(title: "Verify Phone", anchor: scrollView.topAnchor, constant: 10, width: 0.4)

        let divider1 = makeDividers(anchor: verifyPhoneView.bottomAnchor)
        
        let emailLbl = UILabel()
        emailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        emailLbl.text = "Email"
        
        self.scrollView.addSubview(emailLbl)
        emailLbl.translatesAutoresizingMaskIntoConstraints = false
        emailLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        emailLbl.topAnchor.constraint(equalTo: divider1.bottomAnchor).isActive = true
        emailLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        emailLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let verifyEmailView = makeRoundedViewRight(title: "Verify Email", anchor: divider1.bottomAnchor, constant: 10, width: 0.7)
        
        let divider2 = makeDividers(anchor: verifyEmailView.bottomAnchor)

        let identidyLbl = UILabel()
        identidyLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        identidyLbl.text = "Identity"
        
        self.scrollView.addSubview(identidyLbl)
        identidyLbl.translatesAutoresizingMaskIntoConstraints = false
        identidyLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        identidyLbl.topAnchor.constraint(equalTo: divider2.bottomAnchor).isActive = true
        identidyLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        identidyLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let verifyIdentityView = makeRoundedViewRight(title: "Verify Identity", anchor: divider2.bottomAnchor, constant: 10, width: 0.4)
        
        let divider3 = makeDividers(anchor: verifyIdentityView.bottomAnchor)

        facebookBtn.translatesAutoresizingMaskIntoConstraints = false
        linkedInBtn.translatesAutoresizingMaskIntoConstraints = false
        googleBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.addSubview(facebookBtn)
        self.scrollView.addSubview(linkedInBtn)
        self.scrollView.addSubview(googleBtn)
        
        
        //  facebookBtn.setTitle("Register with Facebook", for: .normal)
        facebookBtn.setImage(#imageLiteral(resourceName: "verify_facebook_ic"), for: .normal)
        facebookBtn.imageView?.contentMode = .scaleAspectFit
        facebookBtn.titleLabel?.contentMode = .right
        facebookBtn.layer.cornerRadius = 30
        facebookBtn.backgroundColor = UIColor.lightText
        facebookBtn.layer.borderWidth = 1
        facebookBtn.layer.borderColor = UIColor.black.cgColor
        facebookBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        facebookBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        facebookBtn.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 30).isActive = true
        facebookBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        facebookBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
 //       facebookBtn.addTarget(self, action: #selector(facebookbtnPressed), for: .touchUpInside)
        
        
        //   googleBtn.setTitle("Register with Google", for: .normal)
        googleBtn.setImage(#imageLiteral(resourceName: "verify_google_ic"), for: .normal)
        googleBtn.layer.cornerRadius = 30
        googleBtn.titleLabel?.textAlignment = .right
        googleBtn.imageView?.contentMode = .scaleAspectFit
        googleBtn.backgroundColor = UIColor.clear
        googleBtn.layer.borderWidth = 1
        googleBtn.layer.borderColor = UIColor.black.cgColor
        googleBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        googleBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleBtn.topAnchor.constraint(equalTo: facebookBtn.bottomAnchor, constant: 20).isActive = true
        googleBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        googleBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
   //     googleBtn.addTarget(self, action: #selector(googlebtnPressed), for: .touchUpInside)
        
        
        //   linkedInBtn.setTitle("Register with LinkedIn", for: .normal)
        linkedInBtn.setImage(#imageLiteral(resourceName: "verify_linkedin_ic"), for: .normal)
        linkedInBtn.layer.cornerRadius = 30
        linkedInBtn.titleLabel?.textAlignment = .right
        linkedInBtn.imageView?.contentMode = .scaleAspectFit
        linkedInBtn.backgroundColor = UIColor.clear
        linkedInBtn.layer.borderWidth = 1
        linkedInBtn.layer.borderColor = UIColor.black.cgColor
        linkedInBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: -270, bottom: 20, right: 0)
        linkedInBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        linkedInBtn.topAnchor.constraint(equalTo: googleBtn.bottomAnchor, constant: 20).isActive = true
        linkedInBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        linkedInBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
 //       linkedInBtn.addTarget(self, action: #selector(linkedInbtnPressed), for: .touchUpInside)
        
        
        facebookBtn.addSubview(faceBookLbl)
        linkedInBtn.addSubview(linkedInLbl)
        googleBtn.addSubview(googleLbl)
        
        faceBookLbl.translatesAutoresizingMaskIntoConstraints = false
        linkedInLbl.translatesAutoresizingMaskIntoConstraints = false
        googleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        faceBookLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        faceBookLbl.text = "Continue With Facebook"
        faceBookLbl.textAlignment = .center
        faceBookLbl.textColor = UIColor.black
        faceBookLbl.centerXAnchor.constraint(equalTo: facebookBtn.centerXAnchor).isActive = true
        faceBookLbl.centerYAnchor.constraint(equalTo: facebookBtn.centerYAnchor).isActive = true
        faceBookLbl.widthAnchor.constraint(equalTo: facebookBtn.widthAnchor, multiplier: 0.7).isActive = true
        faceBookLbl.heightAnchor.constraint(equalTo: facebookBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        linkedInLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        linkedInLbl.text = "Register With LinkedIn"
        linkedInLbl.textAlignment = .center
        linkedInLbl.textColor = UIColor.black
        linkedInLbl.centerXAnchor.constraint(equalTo: linkedInBtn.centerXAnchor).isActive = true
        linkedInLbl.centerYAnchor.constraint(equalTo: linkedInBtn.centerYAnchor).isActive = true
        linkedInLbl.widthAnchor.constraint(equalTo: linkedInBtn.widthAnchor, multiplier: 1.0).isActive = true
        linkedInLbl.heightAnchor.constraint(equalTo: linkedInBtn.heightAnchor, multiplier: 1.0).isActive = true
        
        googleLbl.font = UIFont(name: "SFUIText-Light", size: 16.0)
        googleLbl.text = "Register With Google"
        googleLbl.textAlignment = .center
        googleLbl.textColor = UIColor.black
        googleLbl.centerXAnchor.constraint(equalTo: googleBtn.centerXAnchor).isActive = true
        googleLbl.centerYAnchor.constraint(equalTo: googleBtn.centerYAnchor).isActive = true
        googleLbl.widthAnchor.constraint(equalTo: googleBtn.widthAnchor, multiplier: 1.0).isActive = true
        googleLbl.heightAnchor.constraint(equalTo: googleBtn.heightAnchor, multiplier: 1.0).isActive = true
    }

    func makeRoundedView(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat, width: CGFloat) -> UIButton {
        
        let roundedView = UIButton()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.black.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: width).isActive = true
        roundedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        roundedView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        let name = UILabel()
        name.text = title
        name.textAlignment = .center
        name.font = UIFont(name: "SFUIText-Light", size: 12)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor, constant: 0).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.6).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        return roundedView
    }
    
    func makeRoundedViewRight(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat, width: CGFloat) -> UIButton {
        
        let roundedView = UIButton()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.black.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: width).isActive = true
        roundedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        roundedView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        roundedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        
        let name = UILabel()
        name.text = title
        name.textAlignment = .center
        name.font = UIFont(name: "SFUIText-Light", size: 12)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor, constant: 0).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.6).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        return roundedView
    }


    
    func makeDividers(anchor: NSLayoutYAxisAnchor) -> UIView {
        
        let line = UIView()
        scrollView.addSubview(line)
        line.backgroundColor = UIColor.lightGray
        line.alpha = 0.5
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.002).isActive = true
        line.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        line.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        line.topAnchor.constraint(equalTo: anchor, constant: 10).isActive = true
        
        return line
        
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
