//
//  Preferences.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

enum Days: Int {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    func day() -> String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
}

enum TimesFree: Int {
    case morning, lateMorning, afternoon, lateAfternoon, evening
    
    func time() -> String {
        switch self {
        case .morning:
            return "Morning (before 9am)"
        case .lateMorning:
            return "Late Morning (9am to noon)"
        case .afternoon:
            return "Afternoon (noon to 3pm)"
        case .lateAfternoon:
            return "Late Afternoon (3pm-6pm)"
        case .evening:
            return "Evening (after 6pm)"
        }
    }
}

enum TravelRange: Int {
    case here, fiveToNineteenKM, twentyOrMore, oneToOne
    
    func range() -> String {
        switch self {
        case .here:
            return "Have my trainer meet me"
        case .fiveToNineteenKM:
            return "5km - 19km"
        case .twentyOrMore:
            return "20km or more"
        case .oneToOne:
            return "Virtual 1 to 1 meetings"
        }
    }
}

enum HowOften: Int {
    case daily, twoToThreeDays, fourOrMore, onceAWeek, tbd
    
    func frequency() -> String {
        switch self {
        case .daily:
            return "Daily"
        case .twoToThreeDays:
            return "2-3 Days a Week"
        case .fourOrMore:
            return "4 or More Days a Week"
        case .onceAWeek:
            return "Once a Week"
        case .tbd:
            return "To be determined by Trainer"
        }
    }
}

enum Activity: Int {
    case weightLoss, trimmed, muscle, healthier, endurance, bodyBuilding, mental
    
    func actName() -> String {
        switch self {
        case .weightLoss:
            return "Weight Loss"
        case .trimmed:
            return "Trimmed and Toned"
        case .muscle:
            return "Build Muscle Strength"
        case .healthier:
            return "Become Healthier"
        case .endurance:
            return "Increase Endurance and Aerobic Fitness"
        case .bodyBuilding:
            return "Body Building"
        case .mental:
            return "Hollistic Mind & Body Health"
        }
    }
}

struct Preferences {
    var daysAvailable: Array<Days>? = nil
    var timesAvailable: Array<TimesFree>? = nil
    var travelRange: Array<TravelRange>? = nil
    var howOften: Array<HowOften>? = nil
    var activityPreferences: Array<Activity>? = nil
    
}
