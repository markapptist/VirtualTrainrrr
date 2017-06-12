//
//  ClientProfileSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-14.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ClientProfileSegmentVC: UIViewController {

    let scrollView = UIScrollView()
    
    let bioLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 1.6)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        self.makeDivider(title: "About Me", anchor: self.scrollView.topAnchor, dividersHidden: false)
        
        scrollView.addSubview(bioLbl)
        bioLbl.adjustsFontSizeToFitWidth = true
        bioLbl.font = UIFont(name: "SFUIText-Light", size: 16)
        bioLbl.textAlignment = .left
        bioLbl.numberOfLines = 0
        bioLbl.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making."
        bioLbl.translatesAutoresizingMaskIntoConstraints = false
        bioLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        bioLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        bioLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        bioLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        self.makeDivider(title: "Training Interests", anchor: bioLbl.bottomAnchor, dividersHidden: false)
        
        let row1 = makeButtonRow(anchor: bioLbl.bottomAnchor, constant: 70, item1Str: "Yoga", item2Str: "Diet", width1Multiplier: 80, width2Multiplier: 80)
        
        self.makeDivider(title: "Fitness Goals", anchor: row1, dividersHidden: false)
        
        let row2 = makeButtonRow(anchor: row1, constant: 90, item1Str: "Body Building", item2Str: "Weight Loss", width1Multiplier: 150, width2Multiplier: 130)

        self.makeDivider(title: "Training Frequency", anchor: row2, dividersHidden: false)
        
        let row3 = makeButtonRow(anchor: row2, constant: 90, item1Str: "Daily", item2Str: "Once A Week", width1Multiplier: 80, width2Multiplier: 140)
        
        self.makeDivider(title: "Days I'm Available", anchor: row3, dividersHidden: false)
        
        let row4 = makeButtonRow(anchor: row3, constant: 90, item1Str: "Monday", item2Str: "Saturday", width1Multiplier: 120, width2Multiplier: 120)
        
        self.makeDivider(title: "Times I'm Available", anchor: row4, dividersHidden: false)
        
        let row5 = makeButtonRow(anchor: row4, constant: 90, item1Str: "Morning", item2Str: "Afternoon", width1Multiplier: 120, width2Multiplier: 120)
        
        self.makeDivider(title: "Willing To Travel", anchor: row5, dividersHidden: false)
        
        let row6 = makeButtonRow(anchor: row5, constant: 90, item1Str: "5km - 19km", item2Str: "20km or more", width1Multiplier: 130, width2Multiplier: 140)
    
        self.view.backgroundColor = UIColor.white
    }
    
    func showFilterView(sender: ItemButtonBlue) {
        
        if(sender.tag == 0) {
            
            currentTag = tagStates[0]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        if(sender.tag == 1) {
            
            currentTag = tagStates[1]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        if(sender.tag == 2) {
            
            currentTag = tagStates[2]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        if(sender.tag == 3) {
            
            currentTag = tagStates[3]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        if(sender.tag == 4) {
            
            currentTag = tagStates[4]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        if(sender.tag == 5) {
            
            currentTag = tagStates[5]
            NotificationCenter.default.post(name: thirdNotification, object: currentTag, userInfo: ["message": currentTag])
            
        }
        
        print("tag is: " + currentTag)
        
        
    }
    
    func makeAddBtn(anchor: NSLayoutYAxisAnchor, constant: CGFloat, title: String) -> ItemButtonBlue {
        
        let addBtn = ItemButtonBlue()
        addBtn.titleLbl.text = title
        self.scrollView.addSubview(addBtn)
        addBtn.titleLbl.font = UIFont(name: "SFUIText-Light", size: 16)
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        addBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        addBtn.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4).isActive = true
        addBtn.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.07).isActive = true
        
        return addBtn
        
    }
    
    func makeButtonRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat, item1Str: String, item2Str: String, width1Multiplier: CGFloat, width2Multiplier: CGFloat) -> NSLayoutYAxisAnchor {
        
        let itemBtn1 = ItemButton()
        scrollView.addSubview(itemBtn1)
        itemBtn1.translatesAutoresizingMaskIntoConstraints = false
        itemBtn1.titleLbl.text = item1Str
        itemBtn1.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        itemBtn1.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        //     itemBtn1.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4).isActive = true
        itemBtn1.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.06).isActive = true
        itemBtn1.titleLbl.adjustsFontSizeToFitWidth = false
        
        itemBtn1.titleLbl.textAlignment = .left
        //      itemBtn1.titleLbl.widthAnchor.constraint(equalToConstant: width1Multiplier).isActive = true
        
        itemBtn1.widthAnchor.constraint(equalToConstant: width1Multiplier).isActive = true
        
        let itemBtn2 = ItemButton()
        scrollView.addSubview(itemBtn2)
        itemBtn2.translatesAutoresizingMaskIntoConstraints = false
        itemBtn2.titleLbl.text = item2Str
        itemBtn2.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        itemBtn2.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn2.leadingAnchor.constraint(equalTo: itemBtn1.trailingAnchor, constant: 20).isActive = true
        //   itemBtn2.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4).isActive = true
        itemBtn2.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.06).isActive = true
        itemBtn2.titleLbl.adjustsFontSizeToFitWidth = false
        
        itemBtn2.titleLbl.textAlignment = .left
        //      itemBtn2.titleLbl.widthAnchor.constraint(equalToConstant: width2Multiplier).isActive = true
        
        itemBtn2.widthAnchor.constraint(equalToConstant: width2Multiplier).isActive = true
        
        
        return itemBtn1.bottomAnchor
        
    }
    
    func makeDivider(title: String, anchor: NSLayoutYAxisAnchor, dividersHidden: Bool) {
        
        
        let centerLbl = UILabel()
        centerLbl.text = title
        centerLbl.textAlignment = .center
        centerLbl.adjustsFontSizeToFitWidth = true
        centerLbl.font = UIFont(name: "SFUIText-Regular", size: 20)
        scrollView.addSubview(centerLbl)
        centerLbl.translatesAutoresizingMaskIntoConstraints = false
        centerLbl.topAnchor.constraint(equalTo: anchor, constant: 20).isActive = true
        centerLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        centerLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        centerLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        
        let leftLine = UIView()
        scrollView.addSubview(leftLine)
        leftLine.backgroundColor = UIColor.lightGray
        leftLine.alpha = 0.5
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.002).isActive = true
        leftLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        leftLine.trailingAnchor.constraint(equalTo: centerLbl.leadingAnchor, constant: 5).isActive = true
        leftLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        let rightLine = UIView()
        scrollView.addSubview(rightLine)
        rightLine.backgroundColor = UIColor.lightGray
        rightLine.alpha = 0.5
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.002).isActive = true
        rightLine.leadingAnchor.constraint(equalTo: centerLbl.trailingAnchor, constant: 5).isActive = true
        rightLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        rightLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        if dividersHidden == true {
            leftLine.isHidden = true
            rightLine.isHidden = true
        }
    }
    
  
    


}
