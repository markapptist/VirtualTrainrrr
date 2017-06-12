//
//  TrainerAboutMeSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-28.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class TrainerAboutMeSegmentVC: UIViewController {

    let scrollView = UIScrollView()
    
    let bioLbl = UILabel()
    
    let credLbl = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 2.1)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        makeDivider(title: "Biography", anchor: self.scrollView.topAnchor, dividersHidden: false)
        
        scrollView.addSubview(bioLbl)
        bioLbl.adjustsFontSizeToFitWidth = true
        bioLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        bioLbl.textAlignment = .justified
        bioLbl.textColor = UIColor.white
        bioLbl.numberOfLines = 0
        bioLbl.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making."
        bioLbl.translatesAutoresizingMaskIntoConstraints = false
        bioLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        bioLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        bioLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        bioLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        makeDivider(title: "Credentials", anchor: bioLbl.bottomAnchor, dividersHidden: false)
        
        scrollView.addSubview(credLbl)
        credLbl.adjustsFontSizeToFitWidth = true
        credLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        credLbl.textAlignment = .justified
        credLbl.numberOfLines = 0
        credLbl.textColor = UIColor.white
        credLbl.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making."
        credLbl.translatesAutoresizingMaskIntoConstraints = false
        credLbl.topAnchor.constraint(equalTo: bioLbl.bottomAnchor, constant: 50).isActive = true
        credLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        credLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        credLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true

        
        makeDivider(title: "Certifications", anchor: credLbl.bottomAnchor, dividersHidden: false)
        
        let row7 = makeButtonRow(anchor: credLbl.bottomAnchor, constant: 70)

        
        makeDivider(title: "Training Specialisties", anchor: row7, dividersHidden: false)
        
        let row8 = makeButtonRow(anchor: row7, constant: 70)

        makeDivider(title: "Training Frequency", anchor: row8, dividersHidden: false)
        
        let row9 = makeButtonRow(anchor: row8, constant: 70)
        let row10 = makeButtonRow(anchor: row9, constant: 20)
        
        makeDivider(title: "Days I'm Available", anchor: row10, dividersHidden: false)
        
        let row11 = makeButtonRow(anchor: row10, constant: 70)
  
        makeDivider(title: "Times I'm Available", anchor: row11, dividersHidden: false)
        
        let row12 = makeButtonRow(anchor: row11, constant: 70)
        let row13 = makeButtonRow(anchor: row12, constant: 20)
        
        makeDivider(title: "Willing To Travel", anchor: row13, dividersHidden: false)
        
        let row14 = makeButtonRow(anchor: row13, constant: 70)
        
        
    }
    
    func makeAddBtn(anchor: NSLayoutYAxisAnchor, constant: CGFloat, title: String) -> ItemButtonBlue {
        
        let addBtn = ItemButtonBlue()
        addBtn.titleLbl.text = title
        self.scrollView.addSubview(addBtn)
        
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        addBtn.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        addBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        addBtn.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.5).isActive = true
        addBtn.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.07).isActive = true
        
        return addBtn
        
    }
    
    func makeButtonRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat) -> NSLayoutYAxisAnchor {
        
        let itemBtn1 = ItemButton()
        scrollView.addSubview(itemBtn1)
        itemBtn1.titleLbl.textColor = UIColor.white
        itemBtn1.translatesAutoresizingMaskIntoConstraints = false
        itemBtn1.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        itemBtn1.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.26).isActive = true
        itemBtn1.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.07).isActive = true
        
        let itemBtn2 = ItemButton()
        scrollView.addSubview(itemBtn2)
        itemBtn2.titleLbl.textColor = UIColor.white
        itemBtn2.translatesAutoresizingMaskIntoConstraints = false
        itemBtn2.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn2.leadingAnchor.constraint(equalTo: itemBtn1.trailingAnchor, constant: 20).isActive = true
        itemBtn2.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.26).isActive = true
        itemBtn2.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.07).isActive = true
        
        let itemBtn3 = ItemButton()
        scrollView.addSubview(itemBtn3)
        itemBtn3.titleLbl.textColor = UIColor.white
        itemBtn3.translatesAutoresizingMaskIntoConstraints = false
        itemBtn3.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn3.leadingAnchor.constraint(equalTo: itemBtn2.trailingAnchor, constant: 20).isActive = true
        itemBtn3.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.26).isActive = true
        itemBtn3.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.07).isActive = true
        
        return itemBtn1.bottomAnchor
        
    }
    
    func makeDivider(title: String, anchor: NSLayoutYAxisAnchor, dividersHidden: Bool) {
        
        
        let centerLbl = UILabel()
        centerLbl.text = title
        centerLbl.textColor = UIColor.white
        centerLbl.textAlignment = .center
        centerLbl.adjustsFontSizeToFitWidth = true
        centerLbl.font = UIFont(name: "SFUIText-Medium", size: 16)
        scrollView.addSubview(centerLbl)
        centerLbl.translatesAutoresizingMaskIntoConstraints = false
        centerLbl.topAnchor.constraint(equalTo: anchor, constant: 20).isActive = true
        centerLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        centerLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        centerLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        
        let leftLine = UIView()
        scrollView.addSubview(leftLine)
        leftLine.backgroundColor = UIColor.lightGray
        leftLine.alpha = 0.5
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        leftLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.002).isActive = true
        leftLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        leftLine.trailingAnchor.constraint(equalTo: centerLbl.leadingAnchor, constant: 1).isActive = true
        leftLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        let rightLine = UIView()
        scrollView.addSubview(rightLine)
        rightLine.backgroundColor = UIColor.lightGray
        rightLine.alpha = 0.5
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.002).isActive = true
        rightLine.leadingAnchor.constraint(equalTo: centerLbl.trailingAnchor, constant: 5).isActive = true
        rightLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -1).isActive = true
        rightLine.centerYAnchor.constraint(equalTo: centerLbl.centerYAnchor).isActive = true
        
        if dividersHidden == true {
            leftLine.isHidden = true
            rightLine.isHidden = true
        }
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
