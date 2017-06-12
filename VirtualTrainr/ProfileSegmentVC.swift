//
//  ProfileSegmentVC.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-12.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

let thirdNotification = Notification.Name("thirdNotification")
let tagStates = ["0", "1", "2", "3", "4", "5"]
var currentTag: String = ""

let editBioNotification = Notification.Name("Notification")

var textBio = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making."

class ProfileSegmentVC: UIViewController {
    
    let scrollView = UIScrollView()
    
    let bioLbl = UIButton()
    
    let interestString = ["Yoga", "P90X", "Cardio", "Dance", "Bodyweight"]
    
    let fitnessString = ["Weight Loss", "Build Muscle & Strength", "Body Building"]
    
    let frequencyString = ["Once A Week", "Daily"]
    
    let daysString = ["Monday", "Tuesday"]
    
    let timesString = ["Morning", "3pm - 6pm", "Before 9am"]
    
    let travelString = ["20km or more"]
    
    //USE THESE TO ACCESS BUTTONS OF EACH PARTICULAR ROW
    var interestRows:Array<Any> = []
    var fitnessRows:Array<Any> = []
    var frequencyRows:Array<Any> = []
    var daysRows:Array<Any> = []
    var timesRows:Array<Any> = []
    var travelRows:Array<Any> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: self.view.frame.width * 0.8, height: self.view.frame.height * 3.5)
        self.view.addSubview(scrollView)
        
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        
        self.view.backgroundColor = UIColor.white
        
        self.makeDivider(title: "About Me", anchor: self.scrollView.topAnchor, dividersHidden: false)
        
        scrollView.addSubview(bioLbl)
        bioLbl.titleLabel?.adjustsFontSizeToFitWidth = true
        bioLbl.titleLabel?.font = UIFont(name: "SFUIText-Light", size: 16)
        bioLbl.titleLabel?.textAlignment = .left
        bioLbl.titleLabel?.numberOfLines = 0
        bioLbl.setTitleColor(UIColor.black, for: .normal)
        bioLbl.translatesAutoresizingMaskIntoConstraints = false
        bioLbl.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        bioLbl.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9).isActive = true
        bioLbl.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.3).isActive = true
        bioLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        bioLbl.addTarget(self, action: #selector(editBioPressed), for: .touchUpInside)
        
        
        ///TRAINING INTERESTS
        
        self.makeDivider(title: "Training Interests", anchor: bioLbl.bottomAnchor, dividersHidden: false)
        
        let interests = createTrainingInterestsField(items: interestString)
        
        let newInterestBtn = makeAddBtn(anchor: interests, constant: 20, title: "Add new interest +")
        newInterestBtn.tag = 0
        newInterestBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
        
        //FITNESS GOALS
        
        self.makeDivider(title: "Fitness Goals", anchor: newInterestBtn.bottomAnchor, dividersHidden: false)
        
       let fitness = createFitnessGoalsField(items: fitnessString, bottomAnchor: newInterestBtn.bottomAnchor)
        
        let fitnessBtn = makeAddBtn(anchor: fitness, constant: 20, title: "Add Fitness Goals +")
        fitnessBtn.tag = 1
        fitnessBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
        
        //TRAINING FREQUENCY
        
        self.makeDivider(title: "Training Frequency", anchor: fitnessBtn.bottomAnchor, dividersHidden: false)
        
        let frequency = createTrainingFrequencyField(items: frequencyString, bottomAnchor: fitnessBtn.bottomAnchor)
        
        let frequencyBtn = makeAddBtn(anchor: frequency, constant: 20, title: "Edit Frequency +")
        frequencyBtn.tag = 2
        frequencyBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
        
        //DAYS AVAILABLE
        
        self.makeDivider(title: "Days I'm Available", anchor: frequencyBtn.bottomAnchor, dividersHidden: false)
        
        let days = createDaysField(items: daysString, bottomAnchor: frequencyBtn.bottomAnchor)
        
        let availableBtn = makeAddBtn(anchor: days, constant: 20, title: "Edit Availability +")
        availableBtn.tag = 3
        availableBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
        
        //TIMES AVAILABLE
        
        self.makeDivider(title: "Times I'm Available", anchor: availableBtn.bottomAnchor, dividersHidden: false)
        
        let times = createTimesField(items: timesString, bottomAnchor: availableBtn.bottomAnchor)
        
        let timesBtn = makeAddBtn(anchor: times, constant: 20, title: "Edit Availability +")
        timesBtn.tag = 4
        timesBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
        
        //WILLING TO TRAVEL
        
        self.makeDivider(title: "Willing To Travel", anchor: timesBtn.bottomAnchor, dividersHidden: false)
        
        let travel = createTravelField(items: travelString, bottomAnchor: timesBtn.bottomAnchor)
        
        let distanceBtn = makeAddBtn(anchor: travel, constant: 20, title: "Edit Distance +")
        distanceBtn.tag = 5
        distanceBtn.addTarget(self, action: #selector(showFilterView(sender:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        //update buttons in view did appear
        
        //update bio label 
        bioLbl.setTitle(textBio, for: .normal)

    }
    
    func editBioPressed() {
        
        NotificationCenter.default.post(name: editBioNotification, object: nil, userInfo: nil)
        
    }
    
    func createTravelField(items: [String], bottomAnchor: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchor {
        
        let travelRow1 = makeButtonRow(anchor: bottomAnchor, constant: 70, item1Str: "Have Trainer Meet Me", item2Str: "5km-19km", item3Str: "", width1Multiplier: 200, width2Multiplier: 120, width3Multiplier: 0)
        
        let travelRow2 = makeButtonRow(anchor: (travelRow1.first?.bottomAnchor)!, constant: 20, item1Str: "20km or more", item2Str: "Virtual 1 on 1 Meeting", item3Str: "", width1Multiplier: 140, width2Multiplier: 190, width3Multiplier: 0)
        
        if items.contains("Have Trainer Meet Me") {
            travelRow1.first?.alpha = 1.0
        }
        
        if items.contains("5km-19km") {
            travelRow1[1].alpha = 1.0
        }
        
        if items.contains("20km or more") {
            travelRow2.first?.alpha = 1.0
        }
        
        if items.contains("Virtual 1 on 1 Meeting") {
            travelRow2[1].alpha = 1.0
        }
        
        travelRows = [travelRow1, travelRow2]
        
        return (travelRow2.first?.bottomAnchor)!
        
    }
    
    func createTimesField(items: [String], bottomAnchor: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchor {
        
        let timesRow1 = makeButtonRow(anchor: bottomAnchor, constant: 70, item1Str: "After 6pm", item2Str: "Noon - 3pm", item3Str: "", width1Multiplier: 110, width2Multiplier: 120, width3Multiplier: 0)
        
        let timesRow2 = makeButtonRow(anchor: (timesRow1.first?.bottomAnchor)!, constant: 20, item1Str: "Before 9am", item2Str: "3pm - 6pm", item3Str: "", width1Multiplier: 120, width2Multiplier: 125, width3Multiplier: 0)
        
        let timesRow3 = makeButtonRow(anchor: (timesRow2.first?.bottomAnchor)!, constant: 20, item1Str: "9am - noon", item2Str: "", item3Str: "", width1Multiplier: 120, width2Multiplier: 0, width3Multiplier: 0)
        
        if items.contains("After 6pm") {
            timesRow1.first?.alpha = 1.0
        }
        
        if items.contains("Noon - 3pm") {
            timesRow1[1].alpha = 1.0
        }
        
        if items.contains("Before 9am") {
            timesRow2.first?.alpha = 1.0
        }
        
        if items.contains("3pm - 6pm") {
            timesRow2[1].alpha = 1.0
        }
        
        if items.contains("9am - noon") {
            timesRow3.first?.alpha = 1.0
        }
        
        timesRows = [timesRow1, timesRow2, timesRow3]
        
        return (timesRow3.first?.bottomAnchor)!
    }
    
    func createDaysField(items: [String], bottomAnchor: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchor {
        
        let daysRow1 = makeButtonRow(anchor: bottomAnchor, constant: 70, item1Str: "Monday", item2Str: "Tuesday", item3Str: "Wednesday", width1Multiplier: 100, width2Multiplier: 100, width3Multiplier: 110)
        
        let daysRow2 = makeButtonRow(anchor: (daysRow1.first?.bottomAnchor)!, constant: 20, item1Str: "Thursday", item2Str: "Friday", item3Str: "Saturday", width1Multiplier: 100, width2Multiplier: 80, width3Multiplier: 100)
        
        let daysRow3 = makeButtonRow(anchor: (daysRow2.first?.bottomAnchor)!, constant: 20, item1Str: "Sunday", item2Str: "", item3Str: "", width1Multiplier: 90, width2Multiplier: 0, width3Multiplier: 0)
        
        if items.contains("Monday") {
            daysRow1.first?.alpha = 1.0
        }
        
        if items.contains("Tuesday") {
            daysRow1[1].alpha = 1.0
        }
        
        if items.contains("Wednesday") {
            daysRow1[2].alpha = 1.0
        }
        
        if items.contains("Thursday") {
            daysRow2.first?.alpha = 1.0
        }
        
        if items.contains("Friday") {
            daysRow2[1].alpha = 1.0
        }
        
        if items.contains("Saturday") {
            daysRow2[2].alpha = 1.0
        }
        
        if items.contains("Sunday") {
            daysRow3.first?.alpha = 1.0
        }
        
        daysRows = [daysRow1, daysRow2, daysRow3]
        
        return daysRow3.first!.bottomAnchor
        
    }
    
    func createTrainingFrequencyField(items: [String], bottomAnchor: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchor {
        
        let frequencyRow1 = makeButtonRow(anchor: bottomAnchor, constant: 70, item1Str: "Daily", item2Str: "4 or More Days A Week", item3Str: "", width1Multiplier: 75, width2Multiplier: 200, width3Multiplier: 0)
        
        let frequencyRow2 = makeButtonRow(anchor: (frequencyRow1.first?.bottomAnchor)!, constant: 20, item1Str: "Once A Week", item2Str: "", item3Str: "", width1Multiplier: 135, width2Multiplier: 0, width3Multiplier: 0)
        
        let frequencyRow3 = makeButtonRow(anchor: (frequencyRow2.first?.bottomAnchor)!, constant: 20, item1Str: "Determined By Trainer", item2Str: "", item3Str: "", width1Multiplier: 200, width2Multiplier: 0, width3Multiplier: 0)
        
        let frequencyRow4 = makeButtonRow(anchor: (frequencyRow3.first?.bottomAnchor)!, constant: 20, item1Str: "2-3 Days A Week", item2Str: "", item3Str: "", width1Multiplier: 155, width2Multiplier: 0, width3Multiplier: 0)
        
        if items.contains("Daily") {
            frequencyRow1.first?.alpha = 1.0
        }
        
        if items.contains("4 or More Days A Week") {
            frequencyRow1[1].alpha = 1.0
        }
        
        if items.contains("Once A Week") {
            frequencyRow2.first?.alpha = 1.0
        }
        
        if items.contains("Determined By Trainer") {
            frequencyRow3.first?.alpha = 1.0
        }
        
        if items.contains("2-3 Days A Week") {
            frequencyRow4.first?.alpha = 1.0
        }
        
        frequencyRows = [frequencyRow1, frequencyRow2, frequencyRow3, frequencyRow4]
        
        return (frequencyRow4.first?.bottomAnchor)!
        
    }
    
    func createFitnessGoalsField(items: [String], bottomAnchor: NSLayoutYAxisAnchor) -> NSLayoutYAxisAnchor {
        
         let fitnessRow1 = makeButtonRow(anchor: bottomAnchor, constant: 70, item1Str: "Body Building", item2Str: "Weight Loss", item3Str: "", width1Multiplier: 130, width2Multiplier: 125, width3Multiplier: 0)
        
        let fitnessRow2 = makeButtonRow(anchor: (fitnessRow1.first?.bottomAnchor)!, constant: 20, item1Str: "Holistic Mind & Body", item2Str: "", item3Str: "", width1Multiplier: 185, width2Multiplier: 0, width3Multiplier: 0)
        
        let fitnessRow3 = makeButtonRow(anchor: (fitnessRow2.first?.bottomAnchor)!, constant: 20, item1Str: "Build Muscle & Strength", item2Str: "", item3Str: "", width1Multiplier: 210, width2Multiplier: 0, width3Multiplier: 0)
        
        let fitnessRow4 = makeButtonRow(anchor: (fitnessRow3.first?.bottomAnchor)!, constant: 20, item1Str: "Increase Aerobic Fitness", item2Str: "", item3Str: "", width1Multiplier: 210, width2Multiplier: 0, width3Multiplier: 0)
        
        let fitnessRow5 = makeButtonRow(anchor: (fitnessRow4.first?.bottomAnchor)!, constant: 20, item1Str: "Become Healthier", item2Str: "", item3Str: "", width1Multiplier: 160, width2Multiplier: 0, width3Multiplier: 20)
        
        let fitnessRow6 = makeButtonRow(anchor: (fitnessRow5.first?.bottomAnchor)!, constant: 20, item1Str: "Get Trimmed and Toned", item2Str: "", item3Str: "", width1Multiplier: 215, width2Multiplier: 0, width3Multiplier: 0)
        
        if items.contains("Body Building") {
            fitnessRow1.first?.alpha = 1.0
        }
        
        if items.contains("Weight Loss") {
            fitnessRow1[1].alpha = 1.0
        }
        
        if items.contains("Holistic Mind & Body") {
            fitnessRow2.first?.alpha = 1.0
        }
        
        if items.contains("Build Muscle & Strength") {
            fitnessRow3.first?.alpha = 1.0
        }
        
        if items.contains("Increase Aerobic Fitness") {
            fitnessRow4.first?.alpha = 1.0
        }
        
        if items.contains("Become Healthier") {
            fitnessRow5.first?.alpha = 1.0
        }
        
        if items.contains("Get Trimmed and Toned") {
            fitnessRow6.first?.alpha = 1.0
        }
        
        fitnessRows = [fitnessRow1, fitnessRow2, fitnessRow3, fitnessRow4, fitnessRow5, fitnessRow6]
        
        return (fitnessRow6.first?.bottomAnchor)!
    }
    
    func createTrainingInterestsField(items: [String]) -> NSLayoutYAxisAnchor {
        
        let interestsRow1 = makeButtonRow(anchor: bioLbl.bottomAnchor, constant: 70, item1Str: "Yoga", item2Str: "Diet", item3Str: "Weight Loss", width1Multiplier: 75, width2Multiplier: 70, width3Multiplier: 130)
        
        let interestsRow2 = makeButtonRow(anchor: (interestsRow1.first?.bottomAnchor)!, constant: 20, item1Str: "Cardio", item2Str: "Endurance", item3Str: "Nutrition", width1Multiplier: 80, width2Multiplier: 110, width3Multiplier: 100)
        
        let interestsRow3 = makeButtonRow(anchor: (interestsRow2.first?.bottomAnchor)!, constant: 20, item1Str: "Dance", item2Str: "ABX4FIVE", item3Str: "Zumba", width1Multiplier: 80, width2Multiplier: 110, width3Multiplier: 100)
        
        let interestsRow4 = makeButtonRow(anchor: (interestsRow3.first?.bottomAnchor)!, constant: 20, item1Str: "HIIT", item2Str: "Strength Training", item3Str: "", width1Multiplier: 65, width2Multiplier: 160, width3Multiplier: 0)
        
        let interestsRow5 = makeButtonRow(anchor: (interestsRow4.first?.bottomAnchor)!, constant: 20, item1Str: "Personal Training", item2Str: "Bodyweight", item3Str: "", width1Multiplier: 160, width2Multiplier: 120, width3Multiplier: 0)
        
        let interestsRow6 = makeButtonRow(anchor: (interestsRow5.first?.bottomAnchor)!, constant: 20, item1Str: "P90X", item2Str: "BollyX", item3Str: "Power Lifting", width1Multiplier: 70, width2Multiplier: 80, width3Multiplier: 130)
        
        
        if items.contains("Yoga") {
            interestsRow1.first?.alpha = 1.0
        }
        
        if items.contains("Diet") {
            interestsRow1[1].alpha = 1.0
        }
        
        if items.contains("Weight Loss") {
            interestsRow1[2].alpha = 1.0
        }
        
        if items.contains("Cardio") {
            interestsRow2.first?.alpha = 1.0
        }
        
        if items.contains("Endurance") {
            interestsRow2[1].alpha = 1.0
        }
        
        if items.contains("Nutrition") {
            interestsRow2[2].alpha = 1.0
        }
        
        if items.contains("Dance") {
            interestsRow3.first?.alpha = 1.0
        }
        
        if items.contains("ABX4FIVE") {
            interestsRow3[1].alpha = 1.0
        }
        
        if items.contains("Zumba") {
            interestsRow3[2].alpha = 1.0
        }
        
        if items.contains("HIIT") {
            interestsRow4.first?.alpha = 1.0
        }
        
        if items.contains("Strength Training") {
            interestsRow4[1].alpha = 1.0
        }
        
        if items.contains("Personal Training") {
            interestsRow5[0].alpha = 1.0
        }
        
        if items.contains("Bodyweight") {
            interestsRow5[1].alpha = 1.0
        }
        
        if items.contains("P90X") {
            interestsRow6[0].alpha = 1.0
        }
        
        if items.contains("BollyX") {
            interestsRow6[1].alpha = 1.0
        }
        
        if items.contains("Power Lifting") {
            interestsRow6[2].alpha = 1.0
        }
        
        interestRows = [interestsRow1, interestsRow2, interestsRow3, interestsRow4, interestsRow5, interestsRow6]
        
        return (interestsRow6.first?.bottomAnchor)!

        
    }
    
    func makeButton(anchor: NSLayoutYAxisAnchor, constant: CGFloat, itemStr: String) -> ItemButton {
        
        let baseWidth: CGFloat = 18
        let cgChar = CGFloat(itemStr.characters.count)
        var widthMultiplier = CGFloat(baseWidth * cgChar)
        
        if cgChar >= 9 {
            widthMultiplier = 162
        }
        
        let itemBtn1 = ItemButton()
        scrollView.addSubview(itemBtn1)
        itemBtn1.translatesAutoresizingMaskIntoConstraints = false
        itemBtn1.titleLbl.text = itemStr
        itemBtn1.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        itemBtn1.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        //     itemBtn1.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4).isActive = true
        itemBtn1.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.06).isActive = true
        itemBtn1.titleLbl.adjustsFontSizeToFitWidth = false
        
        itemBtn1.titleLbl.textAlignment = .left
        //      itemBtn1.titleLbl.widthAnchor.constraint(equalToConstant: width1Multiplier).isActive = true
        
        
        itemBtn1.widthAnchor.constraint(equalToConstant: widthMultiplier).isActive = true
        
        
        return itemBtn1
        
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
    
    func makeButtonRow(anchor: NSLayoutYAxisAnchor, constant: CGFloat, item1Str: String, item2Str: String, item3Str: String, width1Multiplier: CGFloat, width2Multiplier: CGFloat, width3Multiplier: CGFloat) -> [ItemButton] {
        
        var buttons = [ItemButton]()
        
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
        itemBtn1.alpha = 0.3
  //      itemBtn1.titleLbl.widthAnchor.constraint(equalToConstant: width1Multiplier).isActive = true
        
        itemBtn1.widthAnchor.constraint(equalToConstant: width1Multiplier).isActive = true
        
        buttons.append(itemBtn1)
        
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
        itemBtn2.alpha = 0.3
  //      itemBtn2.titleLbl.widthAnchor.constraint(equalToConstant: width2Multiplier).isActive = true

        itemBtn2.widthAnchor.constraint(equalToConstant: width2Multiplier).isActive = true
    
        buttons.append(itemBtn2)
        
        let itemBtn3 = ItemButton()
        scrollView.addSubview(itemBtn3)
        itemBtn3.translatesAutoresizingMaskIntoConstraints = false
        itemBtn3.titleLbl.text = item3Str
        itemBtn3.titleLbl.font = UIFont(name: "SFUIText-Light", size: 14)
        itemBtn3.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        itemBtn3.leadingAnchor.constraint(equalTo: itemBtn2.trailingAnchor, constant: 20).isActive = true
        //   itemBtn2.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4).isActive = true
        itemBtn3.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 0.06).isActive = true
        itemBtn3.titleLbl.adjustsFontSizeToFitWidth = false
        itemBtn3.titleLbl.textAlignment = .left
        itemBtn3.alpha = 0.3
        //      itemBtn2.titleLbl.widthAnchor.constraint(equalToConstant: width2Multiplier).isActive = true
        
        itemBtn3.widthAnchor.constraint(equalToConstant: width3Multiplier).isActive = true
        
        buttons.append(itemBtn3)
        
        if item2Str.isEmpty {
            itemBtn2.isHidden = true
        }
        
        if item3Str.isEmpty {
            itemBtn3.isHidden = true
        }
        
     
        return buttons
        
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

class EditProfileSegmentVC : UIViewController, UITextViewDelegate {
    
    let textView = UITextView()
    
    let saveBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let topView = UIView()
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = UIColor.gray
        topView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        let topViewTitle = UILabel()
        topView.addSubview(topViewTitle)
        topViewTitle.font = UIFont(name: "SFUIText-Medium", size: 20)
        topViewTitle.textColor = UIColor.white
        topViewTitle.text = "Edit Bio"
        topViewTitle.adjustsFontSizeToFitWidth = true
        topViewTitle.textAlignment = .center
        topViewTitle.translatesAutoresizingMaskIntoConstraints = false
        topViewTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        topViewTitle.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6).isActive = true
        topViewTitle.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.8).isActive = true
        
        let closeBtn = UIButton()
        self.view.addSubview(closeBtn)
        closeBtn.setImage(#imageLiteral(resourceName: "cancel_button.png"), for: .normal)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0).isActive = true
        closeBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeBtn.addTarget(self, action: #selector(closeFilterBtnPressed), for: .touchUpInside)
        
        self.view.addSubview(textView)
        
        textView.delegate = self
        textView.backgroundColor = UIColor.white
        textView.sizeToFit()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.font = UIFont(name: "SFUIText-Medium", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        textView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: topViewTitle.bottomAnchor, constant: 10).isActive = true
        
        self.view.addSubview(saveBtn)
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.titleLabel?.font = UIFont(name: "SFUIText-Medium", size: 14)
        saveBtn.backgroundColor = UIColor.gray
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.layer.cornerRadius = 10
        saveBtn.setTitleColor(UIColor.white, for: .normal)
        saveBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        saveBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        saveBtn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        saveBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        saveBtn.addTarget(self, action: #selector(saveBtnPressed), for: .touchUpInside)
    }
    
    func closeFilterBtnPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func saveBtnPressed() {

        if(!textView.text.isBlank) {
            textBio = textView.text
        }
        
        dismiss(animated: true, completion: nil)
        

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
        
        if(!textView.text.isBlank) {
            textBio = textView.text
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
        
        if(!textView.text.isBlank) {
        textBio = textView.text
        }

    }
    
    func textViewShouldReturn(_ textField: UITextView) -> Bool {
        textView.resignFirstResponder()
        
        if(!textView.text.isBlank) {
            textBio = textView.text
        }
        return true
    }
    
}




