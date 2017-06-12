//
//  CallView.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class CallView: UIView {
    
    enum TitleOptions {
        case caller
        case responder
    }
    
    var callObj: OneToOneCall?
    
    //    var stackview: UIStackView?
    
    var titleLabel: UILabel?
    var userEmailLabel: UILabel?
    var acceptButton: UIButton?
    var cancelButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        /*
         stackview = UIStackView()
         stackview?.axis = .vertical
         stackview?.distribution = .equalSpacing
         stackview?.alignment = .top
         stackview?.spacing = 10
         self.addSubview(stackview!)
         stackview?.translatesAutoresizingMaskIntoConstraints = false
         stackview?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
         stackview?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         stackview?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
         stackview?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75).isActive = true
         stackview?.addArrangedSubview(titleLabel!)
         stackview?.addArrangedSubview(userEmailLabel!)
         */
        
        titleLabel = UILabel()
        titleLabel?.backgroundColor = UIColor.black
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.font = UIFont(name: "SFUIText-Light", size: 16.0)
        titleLabel?.textColor = UIColor.white
        titleLabel?.textAlignment = .center
        self.addSubview(titleLabel!)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        titleLabel?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.30).isActive = true
        
        userEmailLabel = UILabel()
        userEmailLabel?.backgroundColor = UIColor.black
        userEmailLabel?.adjustsFontSizeToFitWidth = true
        userEmailLabel?.font = UIFont(name: "SFUIText-Light", size: 16.0)
        userEmailLabel?.textColor = UIColor.white
        userEmailLabel?.textAlignment = .center
        self.addSubview(userEmailLabel!)
        userEmailLabel?.translatesAutoresizingMaskIntoConstraints = false
        userEmailLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        userEmailLabel?.topAnchor.constraint(equalTo: (titleLabel?.bottomAnchor)!).isActive = true
        userEmailLabel?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        userEmailLabel?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.50).isActive = true
        
        acceptButton = UIButton(type: .system)
        acceptButton?.backgroundColor = UIColor.black
        acceptButton?.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 16.0)
        self.addSubview(acceptButton!)
        acceptButton?.translatesAutoresizingMaskIntoConstraints = false
        acceptButton?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        acceptButton?.topAnchor.constraint(equalTo: (userEmailLabel?.bottomAnchor)!).isActive = true
        acceptButton?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.50).isActive = true
        acceptButton?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20).isActive = true
        
        cancelButton = UIButton(type: .system)
        cancelButton?.backgroundColor = UIColor.black
        cancelButton?.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 16.0)
        self.addSubview(cancelButton!)
        cancelButton?.translatesAutoresizingMaskIntoConstraints = false
        cancelButton?.leadingAnchor.constraint(equalTo: (acceptButton?.trailingAnchor)!).isActive = true
        cancelButton?.topAnchor.constraint(equalTo: (userEmailLabel?.bottomAnchor)!).isActive = true
        cancelButton?.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.50).isActive = true
        cancelButton?.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20).isActive = true
        
    }
    
    func setTitles(option: TitleOptions) {
        if option == .caller {
            titleLabel?.text = "Calling ..."
            acceptButton?.setTitle("Waiting...", for: .normal)
            acceptButton?.isUserInteractionEnabled = false
            cancelButton?.setTitle("Disconnect", for: .normal)
        }
        if option == .responder {
            titleLabel?.text = "Call from ..."
            acceptButton?.setTitle("Accept", for: .normal)
            cancelButton?.setTitle("Reject", for: .normal)
        }
    }
    
    func acceptPressed() {
        let myTrainer = callObj?.trainer!
        let seeker = callObj?.user!
        //        DataService.instance.callAccept(trainer: myTrainer!, user: seeker!)
    }
    
    func cancelPressed() {
        let myTrainer = callObj?.trainer!
        let seeker = callObj?.user!
        //        DataService.instance.callCancelled(trainer: myTrainer!, user: seeker!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

