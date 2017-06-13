//
//  SettingsSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-25.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

let switchToTrainerPortal = Notification.Name("switchToTrainerPortal")

let switchToTraineePortal = Notification.Name("switchToTraineePortal")

let fourthNotification = Notification.Name("fourthNotification")

class SettingsSegmentVC: UIViewController {
    
    let scrollView = UIScrollView()
    
    let tabSwitch = UISegmentedControl()
    
    let languageView = UIView()
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!
    
    let locationLbl = UILabel()
    
    var locationViewTitle = "285 Cordial Dr, Bridgeville"


    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        locationLbl.text = "Location"
        
        self.scrollView.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        locationLbl.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        locationLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
         let locationView = makeRoundedView(title: locationViewTitle, anchor: locationLbl.bottomAnchor, constant: 0)
        
        let divider1 = makeDividers(anchor: locationView.bottomAnchor)
        
        let currencyLbl = UILabel()
        currencyLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        currencyLbl.text = "Currency"
        
        self.scrollView.addSubview(currencyLbl)
        currencyLbl.translatesAutoresizingMaskIntoConstraints = false
        currencyLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        currencyLbl.topAnchor.constraint(equalTo: divider1.bottomAnchor).isActive = true
        currencyLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        currencyLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let currencyView = makeSmallRoundedView(title: "CAD", anchor: divider1.bottomAnchor, constant: 10)
        
        let divider2 = makeDividers(anchor: currencyView.bottomAnchor)
        
        let languageLbl = UILabel()
        languageLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        languageLbl.text = "Language"
        
        self.scrollView.addSubview(languageLbl)
        languageLbl.translatesAutoresizingMaskIntoConstraints = false
        languageLbl.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20).isActive = true
        languageLbl.topAnchor.constraint(equalTo: divider2.bottomAnchor).isActive = true
        languageLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        languageLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        
        let languageView = makeSmallRoundedBtn(title: "English", anchor: divider2.bottomAnchor, constant: 10)
        languageView.addTarget(self, action: #selector(showLanguageView), for: .touchUpInside)
        
        let divider3 = makeDividers(anchor: languageView.bottomAnchor)
        
        tabSwitch.makeRound()
        self.scrollView.addSubview(tabSwitch)
        tabSwitch.insertSegment(withTitle: "Kilometers", at: 0, animated: true)
        tabSwitch.insertSegment(withTitle: "Miles", at: 1, animated: true)
        tabSwitch.setEnabled(true, forSegmentAt: 0)
        tabSwitch.setEnabled(true, forSegmentAt: 1)
        tabSwitch.selectedSegmentIndex = 0
        tabSwitch.layer.cornerRadius = 5
        tabSwitch.tintColor = UIColor.lightGray
        tabSwitch.addTarget(self, action: #selector(indexChanged(_sender:)), for: .valueChanged)
        tabSwitch.translatesAutoresizingMaskIntoConstraints = false
        tabSwitch.topAnchor.constraint(equalTo: divider3.bottomAnchor, constant: 10).isActive = true
        tabSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tabSwitch.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        tabSwitch.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        let divider4 = makeDividers(anchor: tabSwitch.bottomAnchor)
        
        if currentPortal == portals[0] {
            let bottomLocationView = makeRoundedBtn(title: "SWITCH TO TRAINER", anchor: divider4.bottomAnchor, constant: 10)
            bottomLocationView.backgroundColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
            bottomLocationView.addTarget(self, action: #selector(switchPortalPressed), for: .touchUpInside)
        }
        
        if currentPortal == portals[1] {
            let bottomLocationView = makeRoundedBtn(title: "SWITCH TO CLIENT", anchor: divider4.bottomAnchor, constant: 10)
            bottomLocationView.backgroundColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
            bottomLocationView.addTarget(self, action: #selector(switchPortalPressed), for: .touchUpInside)
        }


    }
    
    func showLanguageView() {
        NotificationCenter.default.post(name: fourthNotification, object: currentTag, userInfo: ["message": currentTag])
    }
    
    func switchPortalPressed() {
        
        if currentPortal == portals[0] {
            NotificationCenter.default.post(name: switchToTrainerPortal, object: nil, userInfo: nil)
        }
        
       else if currentPortal == portals[1] {
            NotificationCenter.default.post(name: switchToTraineePortal, object: nil, userInfo: nil)
        }
        
    }
    
    func indexChanged(_sender: AnyObject) {
     print("index changeddd")
    }
    
 
    func makeRoundedView(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        
        let roundedView = UIView()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.lightGray.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
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
    
    func makeRoundedBtn(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIButton {
        
        let roundedView = UIButton()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.lightGray.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        roundedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        roundedView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        roundedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        let name = UILabel()
        name.text = title
        name.textAlignment = .center
        name.textColor = UIColor.white
        name.font = UIFont(name: "SFUIText-Light", size: 12)
        roundedView.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor, constant: 0).isActive = true
        name.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
        name.widthAnchor.constraint(equalTo: roundedView.widthAnchor, multiplier: 0.6).isActive = true
        name.heightAnchor.constraint(equalTo: roundedView.heightAnchor, multiplier: 1.0).isActive = true
        
        
        return roundedView
    }
    
    func makeSmallRoundedView(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        
        let roundedView = UIView()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.lightGray.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
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
    
    func makeSmallRoundedBtn(title: String, anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIButton {
        
        let roundedView = UIButton()
        self.scrollView.addSubview(roundedView)
        roundedView.layer.cornerRadius = 20
        roundedView.layer.borderColor = UIColor.lightGray.cgColor
        roundedView.layer.borderWidth = 1
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
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
}
