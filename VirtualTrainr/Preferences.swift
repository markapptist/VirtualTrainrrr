//
//  Preferences.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

enum Days: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

enum TimesFree: String {
    case morning = "Morning (before 9am)"
    case lateMorning = "Late Morning (9am to noon)"
    case afternoon = "Afternoon (noon to 3pm)"
    case lateAfternoon = "Late Afternoon (3pm-6pm)"
    case evening = "Evening (after 6pm)"
}

enum TravelRange: String {
    case here = "Have my trainer meet me"
    case fiveToNineteenKM = "5km - 19km"
    case twentyOrMore = "20km or more"
    case oneToOne = "Virtual 1 to 1 meetings"
}

enum HowOften: String {
    case daily = "Daily"
    case twoToThreeDays = "2-3 Days a Week"
    case fourOrMore = "4 or More Days a Week"
    case onceAWeek = "Once a Week"
    case tbd = "To be determined by Trainer"
}

enum ActivityPreferences: String {
    case Aerobics = "Aerobics"
    case MentalHealth = "Mental Health"
    case Endurance = "Endurance"
    case WeightLoss = "Weight Loss"
    case StrengthTraining = "Strength and body building"
}

struct Preferences {
    
    var daysAvailable: Array<Days>
    var timesAvailable: Array<TimesFree>
    var travelRange: Array<TravelRange>
    var howOften: Array<HowOften>
    var activityPreferences: Array<ActivityPreferences>
    
}
