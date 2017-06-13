//
//  EditPreferences.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-07.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class EditPreferences: BaseVC {
    
    // determine editing for
    enum EditingFor {
        case interests
        case goals
        case frequency
        case days
        case times
        case travel
    }
    
    // model
    var preference: EditingFor?
    
    // view
    var topView: UIView!
    var topViewTitle: UILabel!
    var closeBtn: UIButton!
    var contentView: UIView!
    var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView = UIView()
        topView.backgroundColor = UIColor.gray
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        topViewTitle = UILabel()
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = title
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topView.addSubview(topViewTitle)
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        closeBtn = UIButton(type: .system)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        self.view.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        closeBtn.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.50).isActive = true
        closeBtn.widthAnchor.constraint(equalTo: closeBtn.heightAnchor).isActive = true
        
        contentView = UIView()
        contentView.backgroundColor = UIColor.white
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.88).isActive = true
        
        /*
         let scrollView = UIScrollView()
         scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.1)
         contentView.addSubview(scrollView)
         scrollView.showsVerticalScrollIndicator = false
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
         scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
         scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
         scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
         */
        
        // next button
        nextBtn = UIButton()
        nextBtn.setImage(#imageLiteral(resourceName: "right_arrow_green_bt"), for: .normal)
        nextBtn.addTarget(self, action: #selector(self.nextBtnPressed), for: .touchUpInside)
        self.view.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor, constant: -20).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        switch (self.preference!) {
        case .interests:
            self.topViewTitle.text = "Training interests"
            
            let row1 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Cardio", itemTwoString: "Strength Training")
            
            let row2 = makeTwoButtonRow(anchor: row1, constant: 20, scrollView: contentView, itemOneString: "Endurance", itemTwoString: "Weight Loss")
            
            let row3 = makeTwoButtonRow(anchor: row2, constant: 20, scrollView: contentView, itemOneString: "Nutrition", itemTwoString: "Cross Fit")
            
            let row4 = makeTwoButtonRow(anchor: row3, constant: 20, scrollView: contentView, itemOneString: "Dance", itemTwoString: "P90X")
            
            let row5 = makeTwoButtonRow(anchor: row4, constant: 20, scrollView: contentView, itemOneString: "ABX4FIVE", itemTwoString: "Zumba")
            
            let row6 = makeTwoButtonRow(anchor: row5, constant: 20, scrollView: contentView, itemOneString: "Power Lifting", itemTwoString: "BollyX")
            
            let row7 = makeTwoButtonRow(anchor: row6, constant: 20, scrollView: contentView, itemOneString: "Bodyweight", itemTwoString: "HIIT")
            
            let row8 = makeTwoButtonRow(anchor: row7, constant: 20, scrollView: contentView, itemOneString: "Personal Training", itemTwoString: "Yoga")
            
        case .goals:
            self.topViewTitle.text = "Fitness goals"
            
            let row9 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Weight Loss", itemTwoString: "Get Trimmed & Toned")
            
            let row10 = makeTwoButtonRow(anchor: row9, constant: 20, scrollView: contentView, itemOneString: "Build Muscle & Strength", itemTwoString: "Become Healthier")
            
            let row11 = makeTwoButtonRow(anchor: row10, constant: 20, scrollView: contentView, itemOneString: "Increase Aerobic Fitness", itemTwoString: "Body Building")
            
            let row12 = makeOneButtonRow(anchor: row11, constant: 20, scrollView: contentView, itemOneString: "Holistic Mind & Body")
            
        case .frequency:
            self.topViewTitle.text = "Training frequency"
            
            let row13 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Daily", itemTwoString: "2-3 Days A Week")
            
            let row14 = makeTwoButtonRow(anchor: row13, constant: 20, scrollView: contentView, itemOneString: "4 or More Days A Week", itemTwoString: "Once A Week")
            
            let row15 = makeOneButtonRow(anchor: row14, constant: 20, scrollView: contentView, itemOneString: "Determined By Trainer")
            
        case .days:
            self.topViewTitle.text = "Days available"
            
            let row16 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Sunday", itemTwoString: "Monday")
            
            let row17 = makeTwoButtonRow(anchor: row16, constant: 20, scrollView: contentView, itemOneString: "Tuesday", itemTwoString: "Wednesday")
            
            let row18 = makeTwoButtonRow(anchor: row17, constant: 20, scrollView: contentView, itemOneString: "Thursday", itemTwoString: "Friday")
            
            let row19 = makeTwoButtonRow(anchor: row18, constant: 20, scrollView: contentView, itemOneString: "Saturday", itemTwoString: "Sunday")
            
        case .times:
            self.topViewTitle.text = "Times available"
            
            let row20 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Before 9 am", itemTwoString: "9am-noon")
            
            let row21 = makeTwoButtonRow(anchor: row20, constant: 20, scrollView: contentView, itemOneString: "noon-3pm", itemTwoString: "3pm-6pm")
            
            let row22 = makeOneButtonRow(anchor: row21, constant: 20, scrollView: contentView, itemOneString: "After 6pm")
            
        case .travel:
            self.topViewTitle.text = "Willingness to travel"
            
            let row23 = makeTwoButtonRow(anchor: topView.bottomAnchor, constant: 15, scrollView: contentView, itemOneString: "Have Trainer Meet Me", itemTwoString: "5km-19km")
            
            let row24 = makeTwoButtonRow(anchor: row23, constant: 20, scrollView: contentView, itemOneString: "20km or more", itemTwoString: "Virtual 1 on 1 Meeting")
        }
    }
    
    
    // MARK: - Set view
    func setPreferencesOptions() {
        
    }
    
    // MARK: - Next button function
    func nextBtnPressed() {
        let updatedVC = UpdatedVC()
        switch (self.preference!) {
        case .interests:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Training interests updated"
            })
            break
        case .goals:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Fitness goals updated"
            })
            break
        case .frequency:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Training frequency updated"
            })
            break
        case .days:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Days available updated"
            })
            break
        case .times:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Times available updated"
            })
            break
        case .travel:
            self.present(updatedVC, animated: true, completion: {
                updatedVC.updatedLbl.text = "Willingness to travel updated"
            })
            break
        }
    }
    
    // dismiss
    func closeBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Updated VC

class UpdatedVC: UIViewController {
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!
    var updatedImgView: UIImageView!
    var updatedLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffect = UIBlurEffect(style: .regular)
        
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = UIColor.darkGray
        blurEffectView.alpha = 0.8
        self.view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        blurEffectView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        updatedImgView = UIImageView()
        updatedImgView.image = #imageLiteral(resourceName: "confirm_check_image")
        self.blurEffectView.addSubview(updatedImgView)
        updatedImgView.translatesAutoresizingMaskIntoConstraints = false
        updatedImgView.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor).isActive = true
        updatedImgView.centerYAnchor.constraint(equalTo: blurEffectView.centerYAnchor).isActive = true
        updatedImgView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        updatedImgView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        updatedLbl = UILabel()
        updatedLbl.font = UIFont(name: "SFUIText-Medium", size: 26)
        updatedLbl.textColor = UIColor.white
        updatedLbl.textAlignment = .center
        self.blurEffectView.addSubview(updatedLbl)
        updatedLbl.translatesAutoresizingMaskIntoConstraints = false
        updatedLbl.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor).isActive = true
        updatedLbl.topAnchor.constraint(equalTo: updatedImgView.bottomAnchor, constant: 10).isActive = true
        updatedLbl.widthAnchor.constraint(equalTo: blurEffectView.widthAnchor).isActive = true
        updatedLbl.heightAnchor.constraint(equalTo: blurEffectView.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        self.perform(#selector(dismissUpdated), with: nil, afterDelay: 1.0)
    }
    
    func dismissUpdated() {
        self.dismiss(animated: true, completion: nil)
    }
}
