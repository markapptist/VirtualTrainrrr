//
//  NewMessageVC.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class NewMessageVC: BaseVC {
    
    var recipient: UILabel?
    var messageBody: UITextField?
    var sendButton: UIButton?
    
    var trainer: Trainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar?.isHidden = true
        
        recipient = UILabel()
        self.view.addSubview(recipient!)
        recipient?.translatesAutoresizingMaskIntoConstraints = false
        recipient?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        recipient?.topAnchor.constraint(equalTo: view.topAnchor, constant: navBarHeight!).isActive = true
        recipient?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        recipient?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15, constant: -(navBarHeight!)).isActive = true
        
        messageBody = UITextField()
        messageBody?.placeholder = "Start typing message here"
        self.view.addSubview(messageBody!)
        messageBody?.translatesAutoresizingMaskIntoConstraints = false
        messageBody?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        messageBody?.topAnchor.constraint(equalTo: (recipient?.bottomAnchor)!, constant: 0).isActive = true
        messageBody?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        messageBody?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
        
        sendButton = UIButton(type: .system)
        sendButton?.setTitle("Send", for: .normal)
        sendButton?.setTitleColor(UIColor.blue, for: .normal)
        sendButton?.addTarget(self, action: #selector(self.sendBtnPressed), for: .touchUpInside)
        self.view.addSubview(sendButton!)
        sendButton?.translatesAutoresizingMaskIntoConstraints = false
        sendButton?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        sendButton?.topAnchor.constraint(equalTo: (messageBody?.bottomAnchor)!, constant: 0).isActive = true
        sendButton?.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        sendButton?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        recipient?.text = trainer?.email
    }
    
    func sendBtnPressed() {
        if messageBody?.text != nil {
            let userUID = self.currentUser.uid
            let email = self.currentUser.email
            //            DataService.instance.sendMessage(recipientUID: (trainer?.uid)!, recipientEmail: (trainer?.email)!, senderUID: userUID, senderEmail: email, messageBody: (messageBody?.text)!)
        }
        else {
            self.showAlertControllerWith(title: "Type a message", message: "")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.messageBody?.resignFirstResponder()
    }
    
}

