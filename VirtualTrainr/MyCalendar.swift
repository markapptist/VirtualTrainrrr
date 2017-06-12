//
//  MyCalendar.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-05-12.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit
import FSCalendar
import Foundation

let calendarNotification = Notification.Name("CalendarNotification")

let calendarBtnNotification = Notification.Name("CalendarBtnNotification")


class MyCalendar: FSCalendar, FSCalendarDelegate, FSCalendarDataSource {
    
    var buttonMode = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.dataSource = self
        self.delegate = self
        
        self.appearance.headerTitleFont = UIFont(name: "SFUIText-Medium", size: 20)
        self.appearance.headerTitleColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)
        self.appearance.weekdayTextColor = UIColor.black
        self.appearance.weekdayFont = UIFont(name: "SFUIText-Light", size: 14)
        self.scrollDirection = .vertical
        self.appearance.todayColor = UIColor.init(red: 49/255, green: 108/255, blue: 156/255, alpha: 1.0)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        if(!buttonMode) {
        NotificationCenter.default.post(name: calendarNotification, object: nil, userInfo: nil)
        }
        
        if(buttonMode){
            NotificationCenter.default.post(name: calendarBtnNotification, object: nil, userInfo: nil)
        }
        
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
  

}
