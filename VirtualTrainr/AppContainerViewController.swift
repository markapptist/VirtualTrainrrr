//
//  AppContainerViewController.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-02.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit


let entry = EntryScreen()

let dashboard = MyDashboard()

class AppContainerViewController: UIViewController {
    
    let detailView = UIView()
    let filterView = UIView()
    
    var blurEffect: UIBlurEffect!
    var blurEffectView: UIVisualEffectView!
    
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    
    let hiddenView = UIView()
    let moreBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        entry.view.frame = self.view.bounds
        self.addChildViewController(entry)
        self.view.addSubview(entry.view)
        /*
         dashboard.view.frame = self.view.bounds
         self.addChildViewController(dashboard)
         self.view.addSubview(dashboard.view)
         */
        blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showApptDetail(notification:)), name: calendarNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.showApplyFitlers(notification:)), name: secondNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showProfile(notification:)), name: profileNotification, object: nil)
        
        self.makeDetailView().isHidden = true
        blurEffectView.isHidden = true
        
        makeFilterView().isHidden = true
        
    }
    
    func showProfile(notification: Notification) {
        
        present(ClientVC(), animated: true, completion: nil)
        
    }
    
    func makeFilterView() -> UIView {
        
        self.view.addSubview(filterView)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        filterView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        filterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        filterView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let topView = UIView()
        filterView.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.gray
        topView.topAnchor.constraint(equalTo: filterView.topAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: filterView.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: filterView.heightAnchor, multiplier: 0.12).isActive = true
        topView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 0).isActive = true
        
        let topViewTitle = UILabel()
        topView.addSubview(topViewTitle)
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = "Choose Filters To Apply"
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        let closeBtn = UIButton()
        filterView.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeFilterBtnPressed), for: .touchUpInside)
        
        let contentView = UIView()
        filterView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.white
        contentView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(equalTo: filterView.heightAnchor, multiplier: 1.0).isActive = true
        contentView.widthAnchor.constraint(equalTo: filterView.widthAnchor, multiplier: 1.0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 0.0).isActive = true
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2.1)
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        let row1 = makeDividers(title: "Price Per Session", anchor: scrollView.topAnchor, dividersHidden: false, scrollView: scrollView)
        
        let upToLbl = UILabel()
        scrollView.addSubview(upToLbl)
        upToLbl.font = UIFont(name: "SFUIText-Medium", size: 18)
        upToLbl.textAlignment = .center
        upToLbl.textColor = UIColor.gray
        upToLbl.text = "Up to:"
        upToLbl.translatesAutoresizingMaskIntoConstraints = false
        upToLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.3).isActive = true
        upToLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        upToLbl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        upToLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60).isActive = true
        
        let slider = CustomUISlider()
        slider.createSliderView(anchor: upToLbl.bottomAnchor, scrollView: scrollView, min: 0, max: 250)
        slider.prefix = "$"
        
        let row2 = makeDividers(title: "Trainers Specialities", anchor: slider.bottomAnchor, dividersHidden: false, scrollView: scrollView)
        
        let row3 = makeTwoButtonRow(anchor: row2, constant: 15, scrollView: scrollView, itemOneString: "Cardio", itemTwoString: "Strength Training")
        
        let row4 = makeTwoButtonRow(anchor: row3, constant: 15, scrollView: scrollView, itemOneString: "Endurance", itemTwoString: "Weight Loss")
        
        let row5 = makeTwoButtonRow(anchor: row4, constant: 15, scrollView: scrollView, itemOneString: "Nutrition", itemTwoString: "Cross Fit")
        
        let row6 = makeTwoButtonRow(anchor: row5, constant: 15, scrollView: scrollView, itemOneString: "Dance", itemTwoString: "P90X")
        
        let row7 = makeTwoButtonRow(anchor: row6, constant: 15, scrollView: scrollView, itemOneString: "ABX4FIVE", itemTwoString: "Zumba")
        
        let row8 = makeTwoButtonRow(anchor: row7, constant: 15, scrollView: scrollView, itemOneString: "Power Lifting", itemTwoString: "BollyX")
        
        /*   makeHiddenView(anchor: row8, constant: 15, scrollView: scrollView)
         
         scrollView.addSubview(moreBtn)
         moreBtn.setTitle("More Specialities", for: .normal)
         moreBtn.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 18)
         moreBtn.titleLabel?.textColor = UIColor.blue
         moreBtn.translatesAutoresizingMaskIntoConstraints = false
         moreBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
         moreBtn.topAnchor.constraint(equalTo: hiddenView.bottomAnchor, constant: 10).isActive = true
         moreBtn.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
         moreBtn.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.02).isActive = true
         
         moreBtn.addTarget(self, action: #selector(moreBtnPressed), for: .touchUpInside)
         */
        
        let row9 = makeDividers(title: "Times Available", anchor: row8, dividersHidden: false, scrollView: scrollView)
        
        let row10 = makeTwoButtonRow(anchor: row9, constant: 15, scrollView: scrollView, itemOneString: "Before 9am", itemTwoString: "9am-noon")
        
        let row11 = makeTwoButtonRow(anchor: row10, constant: 15, scrollView: scrollView, itemOneString: "noon-3pm", itemTwoString: "3pm-6pm")
        
        let row12 = makeOneButtonRow(anchor: row11, constant: 15, scrollView: scrollView, itemOneString: "After 6pm")
        
        let row13 = makeDividers(title: "Days Available", anchor: row12, dividersHidden: false, scrollView: scrollView)
        
        let row14 = makeTwoButtonRow(anchor: row13, constant: 15, scrollView: scrollView, itemOneString: "Sunday", itemTwoString: "Monday")
        
        let row15 = makeTwoButtonRow(anchor: row14, constant: 15, scrollView: scrollView, itemOneString: "Tuesday", itemTwoString: "Wednesday")
        
        let row16 = makeTwoButtonRow(anchor: row15, constant: 15, scrollView: scrollView, itemOneString: "Thursday", itemTwoString: "Friday")
        
        let row17 = makeOneButtonRow(anchor: row16, constant: 15, scrollView: scrollView, itemOneString: "Saturday")
        
        let row18 = makeDividers(title: "Distance From Trainer", anchor: row17, dividersHidden: false, scrollView: scrollView)
        
        let upToLbl2 = UILabel()
        scrollView.addSubview(upToLbl2)
        upToLbl2.font = UIFont(name: "SFUIText-Medium", size: 18)
        upToLbl2.textAlignment = .left
        upToLbl2.textColor = UIColor.gray
        upToLbl2.text = "Up to:"
        upToLbl2.translatesAutoresizingMaskIntoConstraints = false
        upToLbl2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.2).isActive = true
        upToLbl2.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.05).isActive = true
        upToLbl2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        upToLbl2.topAnchor.constraint(equalTo: row18, constant: 15).isActive = true
        
        let slider2 = CustomUISlider()
        slider2.createSliderView(anchor: upToLbl2.bottomAnchor, scrollView: scrollView, min: 0, max: 50)
        slider2.suffix = "km"
        
        let certifiedImgView = UIImageView()
        scrollView.addSubview(certifiedImgView)
        certifiedImgView.image = #imageLiteral(resourceName: "certified_check.png")
        certifiedImgView.contentMode = .scaleAspectFit
        certifiedImgView.translatesAutoresizingMaskIntoConstraints = false
        certifiedImgView.topAnchor.constraint(equalTo: slider2.bottomAnchor, constant: 20).isActive = true
        certifiedImgView.leadingAnchor.constraint(equalTo: upToLbl2.leadingAnchor).isActive = true
        certifiedImgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        certifiedImgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let certifiedLbl = UILabel()
        scrollView.addSubview(certifiedLbl)
        certifiedLbl.translatesAutoresizingMaskIntoConstraints = false
        certifiedLbl.text = "Certified Trainer"
        certifiedLbl.textAlignment = .left
        certifiedLbl.font = UIFont(name: "SFUIText-Medium", size: 16)
        certifiedLbl.textColor = UIColor.black
        certifiedLbl.leadingAnchor.constraint(equalTo: certifiedImgView.trailingAnchor, constant: 15).isActive = true
        certifiedLbl.centerYAnchor.constraint(equalTo: certifiedImgView.centerYAnchor).isActive = true
        certifiedLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        certifiedLbl.heightAnchor.constraint(equalTo: certifiedImgView.heightAnchor, multiplier: 0.7).isActive = true
        
        let certifiedSwitch = UISwitch()
        scrollView.addSubview(certifiedSwitch)
        certifiedSwitch.translatesAutoresizingMaskIntoConstraints = false
        certifiedSwitch.onTintColor = UIColor.init(red: 63/255, green: 108/255, blue: 171/255, alpha: 1.0)
        certifiedSwitch.isOn = true
        certifiedSwitch.centerYAnchor.constraint(equalTo: certifiedLbl.centerYAnchor).isActive = true
        certifiedSwitch.leadingAnchor.constraint(equalTo: certifiedLbl.trailingAnchor, constant: 15).isActive = true
        certifiedSwitch.widthAnchor.constraint(equalTo: certifiedLbl.widthAnchor, multiplier: 0.2).isActive = true
        certifiedSwitch.heightAnchor.constraint(equalTo: certifiedLbl.heightAnchor, multiplier: 1.0).isActive = true
        
        let applyFiltersBtn = SelectedItemButton()
        scrollView.addSubview(applyFiltersBtn)
        applyFiltersBtn.setTitle("Apply Filters", for: .normal)
        applyFiltersBtn.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 12)
        applyFiltersBtn.titleLabel?.textAlignment = .center
        applyFiltersBtn.titleLabel?.textColor = UIColor.white
        applyFiltersBtn.titleLbl.removeFromSuperview()
        applyFiltersBtn.layer.cornerRadius = 16
        applyFiltersBtn.translatesAutoresizingMaskIntoConstraints = false
        applyFiltersBtn.backgroundColor = UIColor.init(red: 63/255, green: 108/255, blue: 171/255, alpha: 1.0)
        applyFiltersBtn.topAnchor.constraint(equalTo: certifiedLbl.bottomAnchor, constant: 40).isActive = true
        applyFiltersBtn.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        applyFiltersBtn.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        applyFiltersBtn.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.1).isActive = true
        
        applyFiltersBtn.removeTarget(self, action: #selector(applyFiltersBtn.btnPressed), for: .touchUpInside)
        applyFiltersBtn.addTarget(self, action: #selector(applyFiltersBtnPressed), for: .touchUpInside)
        
        return filterView
        
    }
    
    func applyFiltersBtnPressed() {
        
        filterView.isHidden = true
        
    }
    
    func makeHiddenView(anchor: NSLayoutYAxisAnchor, constant: CGFloat, scrollView: UIScrollView) -> UIView {
        
        scrollView.addSubview(hiddenView)
        hiddenView.translatesAutoresizingMaskIntoConstraints = false
        hiddenView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1.0).isActive = true
        hiddenView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.01).isActive = true
        hiddenView.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        hiddenView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        
        let row9 = makeTwoButtonRow(anchor: anchor, constant: 0, scrollView: hiddenView, itemOneString: "Bodyweight", itemTwoString: "HIIT")
        let row10 = makeTwoButtonRow(anchor: row9, constant: 15, scrollView: hiddenView, itemOneString: "Personal Training", itemTwoString: "Yoga")
        let row11 = makeTwoButtonRow(anchor: row10, constant: 15, scrollView: hiddenView, itemOneString: "Outdoor Activities", itemTwoString: "Wellness Coaching")
        let row12 = makeTwoButtonRow(anchor: row11, constant: 15, scrollView: hiddenView, itemOneString: "Circuit Training", itemTwoString: "Core Training")
        let row13 = makeTwoButtonRow(anchor: row12, constant: 15, scrollView: hiddenView, itemOneString: "Rehabilitation Training", itemTwoString: "Sport Specific Training")
        let row14 = makeOneButtonRow(anchor: row13, constant: 15, scrollView: hiddenView, itemOneString: "Bootcamp")
        
        return hiddenView
        
    }
    
    func moreBtnPressed() {
        
        if(!moreBtn.isSelected) {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.hiddenView.heightAnchor.constraint(equalTo: self.hiddenView.heightAnchor, multiplier: 2.0).isActive = true
            })
            
            moreBtn.setTitle("Less Specialities", for: .normal)
            
        } else if(moreBtn.isSelected) {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.hiddenView.heightAnchor.constraint(equalTo: self.hiddenView.heightAnchor, multiplier: 1.0).isActive = true
            })
            
            moreBtn.setTitle("More Specialities", for: .normal)
            
        }
        
    }
    
    func makeDetailView() -> UIView {
        detailView.backgroundColor = UIColor.clear
        
        blurEffectView.backgroundColor = UIColor.darkGray
        blurEffectView.alpha = 0.8
        self.view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        blurEffectView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        blurEffectView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        blurEffectView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        detailView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
        detailView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        detailView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        let closeBtn = UIButton()
        detailView.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        
        let titleLbl = UILabel()
        detailView.addSubview(titleLbl)
        titleLbl.text = "Appointment Details"
        titleLbl.textColor = UIColor.white
        titleLbl.textAlignment = .center
        titleLbl.adjustsFontSizeToFitWidth = true
        titleLbl.font = UIFont(name: "SFUIText-Medium", size: 33)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        titleLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        
        let subTitleLbl = UILabel()
        detailView.addSubview(subTitleLbl)
        subTitleLbl.text = "View and edit your appointments"
        subTitleLbl.textColor = UIColor.white
        subTitleLbl.textAlignment = .center
        subTitleLbl.adjustsFontSizeToFitWidth = true
        subTitleLbl.font = UIFont(name: "SFUIText-Light", size: 20)
        subTitleLbl.translatesAutoresizingMaskIntoConstraints = false
        subTitleLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 0).isActive = true
        subTitleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        subTitleLbl.widthAnchor.constraint(equalTo: titleLbl.widthAnchor, multiplier: 0.9).isActive = true
        subTitleLbl.heightAnchor.constraint(equalTo: titleLbl.heightAnchor, multiplier: 0.4).isActive = true
        
        let statusView = UIView()
        detailView.addSubview(statusView)
        statusView.backgroundColor = UIColor.lightGray
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        statusView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        statusView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statusView.topAnchor.constraint(equalTo: subTitleLbl.bottomAnchor, constant: 50).isActive = true
        
        let statusLbl = UILabel()
        detailView.addSubview(statusLbl)
        statusLbl.text = "Status"
        statusLbl.textAlignment = .center
        statusLbl.textColor = UIColor.white
        statusLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        statusLbl.translatesAutoresizingMaskIntoConstraints = false
        statusLbl.widthAnchor.constraint(equalTo: statusView.widthAnchor, multiplier: 0.2).isActive = true
        statusLbl.heightAnchor.constraint(equalTo: statusView.heightAnchor, multiplier: 0.8).isActive = true
        statusLbl.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
        statusLbl.centerYAnchor.constraint(equalTo: statusView.centerYAnchor).isActive = true
        
        let confirmedLbl = UILabel()
        detailView.addSubview(confirmedLbl)
        confirmedLbl.text = "Confirmed"
        confirmedLbl.textAlignment = .center
        confirmedLbl.textColor = UIColor.white
        confirmedLbl.font = UIFont(name: "SFUIText-Light", size: 16)
        confirmedLbl.translatesAutoresizingMaskIntoConstraints = false
        confirmedLbl.widthAnchor.constraint(equalTo: statusView.widthAnchor, multiplier: 0.7).isActive = true
        confirmedLbl.heightAnchor.constraint(equalTo: statusView.heightAnchor, multiplier: 0.5).isActive = true
        confirmedLbl.centerXAnchor.constraint(equalTo: statusView.centerXAnchor).isActive = true
        confirmedLbl.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 10).isActive = true
        
        let trainerView = UIView()
        detailView.addSubview(trainerView)
        trainerView.backgroundColor = UIColor.lightGray
        trainerView.translatesAutoresizingMaskIntoConstraints = false
        trainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        trainerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        trainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        trainerView.topAnchor.constraint(equalTo: confirmedLbl.bottomAnchor, constant: 10).isActive = true
        
        let trainerLbl = UILabel()
        trainerLbl.text = "Trainer"
        trainerLbl.textAlignment = .center
        trainerLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        trainerLbl.textColor = UIColor.white
        detailView.addSubview(trainerLbl)
        trainerLbl.translatesAutoresizingMaskIntoConstraints = false
        trainerLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        trainerLbl.heightAnchor.constraint(equalTo: trainerView.heightAnchor, multiplier: 1.0).isActive = true
        trainerLbl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        trainerLbl.centerYAnchor.constraint(equalTo: trainerView.centerYAnchor).isActive = true
        
        let locationLbl = UILabel()
        locationLbl.text = "Location"
        locationLbl.textAlignment = .center
        locationLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        locationLbl.textColor = UIColor.white
        detailView.addSubview(locationLbl)
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        locationLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        locationLbl.heightAnchor.constraint(equalTo: trainerView.heightAnchor, multiplier: 1.0).isActive = true
        locationLbl.leadingAnchor.constraint(equalTo: trainerLbl.trailingAnchor, constant: 30).isActive = true
        locationLbl.centerYAnchor.constraint(equalTo: trainerView.centerYAnchor).isActive = true
        
        let locationEditBtn = UIButton()
        detailView.addSubview(locationEditBtn)
        locationEditBtn.setImage(#imageLiteral(resourceName: "text_edit_ic.png"), for: .normal)
        locationEditBtn.translatesAutoresizingMaskIntoConstraints = false
        locationEditBtn.leadingAnchor.constraint(equalTo: locationLbl.trailingAnchor, constant: -10).isActive = true
        locationEditBtn.centerYAnchor.constraint(equalTo: locationLbl.centerYAnchor).isActive = true
        locationEditBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationEditBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let imageView = UIImageView()
        self.detailView.addSubview(imageView)
        imageView.makeRound()
        imageView.image = #imageLiteral(resourceName: "sample_image.png")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        imageView.topAnchor.constraint(equalTo: trainerView.bottomAnchor, constant: 10).isActive = true
        
        
        let nameLbl = UILabel()
        self.detailView.addSubview(nameLbl)
        nameLbl.text = "John Smith"
        nameLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        nameLbl.textAlignment = .left
        nameLbl.textColor = UIColor.white
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.3).isActive = true
        nameLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.02).isActive = true
        nameLbl.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).isActive = true
        nameLbl.topAnchor.constraint(equalTo: trainerView.bottomAnchor, constant: 20).isActive = true
        
        star1.image = #imageLiteral(resourceName: "full_star")
        star1.contentMode = .scaleAspectFit
        detailView.addSubview(star1)
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.leadingAnchor.constraint(equalTo: nameLbl.leadingAnchor, constant: 0).isActive = true
        star1.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star1.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star1.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star2.image = #imageLiteral(resourceName: "full_star")
        star2.contentMode = .scaleAspectFit
        detailView.addSubview(star2)
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.leadingAnchor.constraint(equalTo: self.star1.trailingAnchor, constant: 1).isActive = true
        star2.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star2.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star2.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star3.image = #imageLiteral(resourceName: "full_star")
        star3.contentMode = .scaleAspectFit
        detailView.addSubview(star3)
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.leadingAnchor.constraint(equalTo: self.star2.trailingAnchor, constant: 1).isActive = true
        star3.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star3.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star3.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star4.image = #imageLiteral(resourceName: "empty_star")
        star4.contentMode = .scaleAspectFit
        detailView.addSubview(star4)
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.leadingAnchor.constraint(equalTo: self.star3.trailingAnchor, constant: 1).isActive = true
        star4.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star4.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star4.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        star5.image = #imageLiteral(resourceName: "empty_star")
        star5.contentMode = .scaleAspectFit
        detailView.addSubview(star5)
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.leadingAnchor.constraint(equalTo: self.star4.trailingAnchor, constant: 1).isActive = true
        star5.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 0).isActive = true
        star5.widthAnchor.constraint(equalTo: locationLbl.widthAnchor, multiplier: 0.1).isActive = true
        star5.heightAnchor.constraint(equalTo: locationLbl.heightAnchor, multiplier: 0.5).isActive = true
        
        let addressLbl = UILabel()
        detailView.addSubview(addressLbl)
        addressLbl.textColor = UIColor.white
        addressLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        addressLbl.text = "285 Cordial Dr,"
        addressLbl.adjustsFontSizeToFitWidth = true
        addressLbl.textAlignment = .center
        addressLbl.numberOfLines = 2
        addressLbl.translatesAutoresizingMaskIntoConstraints = false
        addressLbl.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.4).isActive = true
        addressLbl.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        addressLbl.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -15).isActive = true
        addressLbl.topAnchor.constraint(equalTo: nameLbl.topAnchor, constant: 0).isActive = true
        
        let addressLbl2 = UILabel()
        detailView.addSubview(addressLbl2)
        addressLbl2.textColor = UIColor.white
        addressLbl2.font = UIFont(name: "SFUIText-Light", size: 14)
        addressLbl2.text = "Bridgeville, PA, 15017"
        addressLbl2.adjustsFontSizeToFitWidth = true
        addressLbl2.textAlignment = .center
        addressLbl2.numberOfLines = 2
        addressLbl2.translatesAutoresizingMaskIntoConstraints = false
        addressLbl2.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.4).isActive = true
        addressLbl2.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        addressLbl2.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -15).isActive = true
        addressLbl2.topAnchor.constraint(equalTo: addressLbl.bottomAnchor, constant: 0).isActive = true
        
        
        let dateTimeView = UIView()
        detailView.addSubview(dateTimeView)
        dateTimeView.backgroundColor = UIColor.lightGray
        dateTimeView.translatesAutoresizingMaskIntoConstraints = false
        dateTimeView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        dateTimeView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true
        dateTimeView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dateTimeView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        
        let dateLbl = UILabel()
        dateLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        dateLbl.textAlignment = .center
        dateLbl.text = "Date"
        dateLbl.textColor = UIColor.white
        detailView.addSubview(dateLbl)
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.centerXAnchor.constraint(equalTo: trainerLbl.centerXAnchor, constant: 0).isActive = true
        dateLbl.widthAnchor.constraint(equalTo: self.detailView.widthAnchor, multiplier: 0.2).isActive = true
        dateLbl.topAnchor.constraint(equalTo: dateTimeView.topAnchor, constant: 0).isActive = true
        dateLbl.heightAnchor.constraint(equalTo: dateTimeView.heightAnchor, constant: 0).isActive = true
        
        let dateLblEditBtn = UIButton()
        detailView.addSubview(dateLblEditBtn)
        dateLblEditBtn.setImage(#imageLiteral(resourceName: "text_edit_ic.png"), for: .normal)
        dateLblEditBtn.translatesAutoresizingMaskIntoConstraints = false
        dateLblEditBtn.leadingAnchor.constraint(equalTo: dateLbl.trailingAnchor, constant: -10).isActive = true
        dateLblEditBtn.centerYAnchor.constraint(equalTo: dateLbl.centerYAnchor).isActive = true
        dateLblEditBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dateLblEditBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let dateDetailLbl = UILabel()
        detailView.addSubview(dateDetailLbl)
        dateDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        dateDetailLbl.text = "Sept. 6, 2016"
        dateDetailLbl.textAlignment = .center
        dateDetailLbl.textColor = UIColor.white
        dateDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        dateDetailLbl.topAnchor.constraint(equalTo: dateTimeView.bottomAnchor, constant: 0).isActive = true
        dateDetailLbl.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.5).isActive = true
        dateDetailLbl.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.1).isActive = true
        dateDetailLbl.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 0).isActive = true
        
        let timeDetailLbl = UILabel()
        detailView.addSubview(timeDetailLbl)
        timeDetailLbl.translatesAutoresizingMaskIntoConstraints = false
        timeDetailLbl.text = "8:00 am"
        timeDetailLbl.textColor = UIColor.white
        timeDetailLbl.textAlignment = .center
        timeDetailLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        timeDetailLbl.topAnchor.constraint(equalTo: dateTimeView.bottomAnchor, constant: 0).isActive = true
        timeDetailLbl.widthAnchor.constraint(equalTo: detailView.widthAnchor, multiplier: 0.5).isActive = true
        timeDetailLbl.heightAnchor.constraint(equalTo: detailView.heightAnchor, multiplier: 0.1).isActive = true
        timeDetailLbl.leadingAnchor.constraint(equalTo: dateDetailLbl.trailingAnchor, constant: 0).isActive = true
        
        let timeLbl = UILabel()
        timeLbl.font = UIFont(name: "SFUIText-Light", size: 22)
        timeLbl.textAlignment = .center
        timeLbl.text = "Time"
        timeLbl.textColor = UIColor.white
        detailView.addSubview(timeLbl)
        timeLbl.translatesAutoresizingMaskIntoConstraints = false
        timeLbl.centerXAnchor.constraint(equalTo: locationLbl.centerXAnchor, constant: 0).isActive = true
        timeLbl.widthAnchor.constraint(equalTo: self.detailView.widthAnchor, multiplier: 0.2).isActive = true
        timeLbl.topAnchor.constraint(equalTo: dateTimeView.topAnchor, constant: 0).isActive = true
        timeLbl.heightAnchor.constraint(equalTo: dateTimeView.heightAnchor, constant: 0).isActive = true
        
        let timeLblEditBtn = UIButton()
        detailView.addSubview(timeLblEditBtn)
        timeLblEditBtn.setImage(#imageLiteral(resourceName: "text_edit_ic.png"), for: .normal)
        timeLblEditBtn.translatesAutoresizingMaskIntoConstraints = false
        timeLblEditBtn.leadingAnchor.constraint(equalTo: timeLbl.trailingAnchor, constant: -10).isActive = true
        timeLblEditBtn.centerYAnchor.constraint(equalTo: timeLbl.centerYAnchor).isActive = true
        timeLblEditBtn.widthAnchor.constraint(equalToConstant: 20).isActive = true
        timeLblEditBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        return detailView
    }
    
    func closeBtnPressed()
    {
        self.detailView.isHidden = true
        self.blurEffectView.isHidden = true
    }
    
    func closeFilterBtnPressed() {
        self.filterView.isHidden = true
    }
    
    func showApptDetail(notification: Notification) {
        self.detailView.isHidden = false
        self.blurEffectView.isHidden = false
    }
    
    func showApplyFitlers(notification: Notification) {
        self.filterView.isHidden = false
    }
    
}
