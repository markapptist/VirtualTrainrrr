//
//  DataService.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//
import Foundation
import FirebaseDatabase

protocol OfflineDelegate {
    func didGoOffline(email: String)
}

class DataService: DataBase {
    enum Preferences {
        case seeker
        case trainer
    }
    
    enum VerifiedAccount {
        case email
        case facebook
        case googlePlus
        case linkedin
    }
    
    var authDelegate: AuthenticateStatus?
    
    private static let _instance = DataService()
    
    // public instance
    static var instance: DataService {
        return _instance
    }
    
    // MARK: - User
    func createUser(uid: String, email: String, preferences: Preferences) {
        var userPreferences = self.createPreferenceProfile(preferences: preferences)
        if preferences == .seeker {
            let seekerProfileID = self.createUniqueID()
            let profile = ["email": email, "seekerProfile": seekerProfileID]
            userPreferences?.updateValue(email, forKey: "email")
            let childUpdates = ["/Public/SeekerProfiles/\(seekerProfileID)": userPreferences!,
                                "/users/\(uid)": profile]
            self.mainRef.updateChildValues(childUpdates)
            authDelegate?.didCompleteLogin()
        }
        if preferences == .trainer {
            let trainerProfileID = self.createUniqueID()
            let profile = ["email": email, "trainerProfile": trainerProfileID]
            userPreferences?.updateValue(email, forKey: "email")
            let childUpdates = ["/Public/TrainerProfiles/\(trainerProfileID)": userPreferences!,
                                "/users/\(uid)": profile]
            self.mainRef.updateChildValues(childUpdates)
            authDelegate?.didCompleteTrainer()
        }
    }
    
    // create user bio in profiles
    func createBioFor(seekerProfileRef: String?, trainerProfileRef: String?, profileBio: String) {
        if let seekerID = seekerProfileRef {
            let newBio = ["bio": profileBio]
            self.seekerProfileRef.child(seekerID).updateChildValues(newBio)
        }
        if let trainerID = seekerProfileRef {
            
        }
    }
    
    // MARK: - Create child and value
    func testRef(uid: String, child: String, value: Any) {
        self.usersRef.child(uid).child(child).setValue(value)
        //        let apn = "c1uuTr4gOc4:APA91bFhELY19zJaILAHi5jPCwY1oY1wqCW2RBtq2ml303W_AUdritAvtGxbZaKm6deAD9jWrRy7FIIf6wXZsi-s12vgoWFSZAPJJvZH62t-va3WDzHigQEimox5yCdbdSpEXc3mA8K7"
    }
    
    // MARK: - User Preferences
    func createPreferenceProfile(preferences: Preferences) -> Dictionary<String, Any>? {
        var userPreferences: [String:Any] = [:]
        if preferences == .seeker {
            if let goals = UserDefaults.standard.object(forKey: "FitnessGoals") as? NSDictionary {
                let goalsPicked = goals.allValues as! [String]
                let created = self.buildProfile(part: "FitnessGoals", array: goalsPicked)
                userPreferences.updateValue(created!, forKey: "FitnessGoals")
            }
            if let trainTimes = UserDefaults.standard.object(forKey: "TrainingTimes") as? NSDictionary {
                let timesChosen = trainTimes.allValues as! [String]
                let created = self.buildProfile(part: "TrainingTimes", array: timesChosen)
                userPreferences.updateValue(created!, forKey: "TrainingTimes")
            }
            if let hours = UserDefaults.standard.object(forKey: "TimesAvail") as? NSDictionary {
                let hoursChosen = hours.allValues as! [String]
                let created = self.buildProfile(part: "TimesAvail", array: hoursChosen)
                userPreferences.updateValue(created!, forKey: "TimesAvail")
            }
            if let days = UserDefaults.standard.object(forKey: "DaysAvail") as? NSDictionary {
                let daysChosen = days.allValues as! [String]
                let created = self.buildProfile(part: "DaysAvail", array: daysChosen)
                userPreferences.updateValue(created!, forKey: "DaysAvail")
            }
            if let birthdate = UserDefaults.standard.object(forKey: "Birthdate") as? String {
                userPreferences.updateValue(birthdate, forKey: "Birthdate")
            }
            if let findTrainer = UserDefaults.standard.object(forKey: "TrainerWhen") as? NSDictionary {
                userPreferences.updateValue(findTrainer, forKey: "TrainerWhen")
            }
            let travel = self.buildProfile(part: "Travel", array: nil)
            userPreferences.updateValue(travel!, forKey: "Travel")
            
            let trainingInterests = self.buildProfile(part: "TrainingInterests", array: nil)
            userPreferences.updateValue(trainingInterests!, forKey: "TrainingInterests")
            
            return userPreferences
        }
        if preferences == .trainer {
            if let firstName = UserDefaults.standard.object(forKey: "FirstName") as? String {
                userPreferences.updateValue(firstName, forKey: "FirstName")
            }
            if let lastName = UserDefaults.standard.object(forKey: "LastName") as? String {
                userPreferences.updateValue(lastName, forKey: "LastName")
            }
            if let gender = UserDefaults.standard.object(forKey: "Gender") as? String {
                userPreferences.updateValue(gender, forKey: "Gender")
            }
            return userPreferences
        }
        return userPreferences
    }
    
    // MARK: - User Defaults
    func buildProfile(part: String, array: [String]?) -> Dictionary<String, Any>? {
        var defaultValues: [String:Any]?
        if part == "FitnessGoals" {
            defaultValues = ["Weight Loss":false, "Get Trimmed and Toned":false, "Build Muscle Strength":false, "Become Healthier":false, "Increase Endurance and Aerobic Fitness":false, "Body Building":false, "Holistic Mind and Body":false]
            if let goals = array {
                for title in (defaultValues?.keys)! {
                    if goals.contains(title) {
                        defaultValues?.updateValue(true, forKey: title)
                    }
                }
            }
        }
        if part == "TrainingTimes" {
            defaultValues = ["Daily":false, "2-3 Days a Week": false, "4 or More Days a Week":false, "Once a Week":false, "Determined By Trainer":false]
            if let trainTimes = array {
                for title in (defaultValues?.keys)! {
                    if trainTimes.contains(title) {
                        defaultValues?.updateValue(true, forKey: title)
                    }
                }
                return defaultValues
            }
        }
        if part == "TimesAvail" {
            defaultValues = ["Before 9am":false, "9am to noon": false, "Noon to 3pm":false, "3pm - 6pm":false, "After 6pm":false]
            if let timesAvail = array {
                for title in (defaultValues?.keys)! {
                    if timesAvail.contains(title) {
                        defaultValues?.updateValue(true, forKey: title)
                    }
                }
                return defaultValues
            }
        }
        if part == "DaysAvail" {
            defaultValues = ["Monday":false, "Tuesday": false, "Wednesday":false, "Thursday":false, "Friday":false, "Saturday":false, "Sunday":false]
            if let daysAvail = array {
                for title in (defaultValues?.keys)! {
                    if daysAvail.contains(title) {
                        defaultValues?.updateValue(true, forKey: title)
                    }
                }
                return defaultValues
            }
        }
        if part == "Travel" {
            defaultValues = ["Have trainer meet me":false, "5km - 19km": false, "20km or more":false, "Virtual 1 to 1 Meeting":false]
            return defaultValues
        }
        if part == "TrainingInterests" {
            defaultValues = ["Cardio":false, "Strength Training": false, "Endurance":false, "Weight Loss":false, "Nutrition":false, "Cross Fit":false, "Dance":false, "P90X":false, "ABX4FIVE":false, "Zumba":false, "Power Lifting":false, "BollyX":false, "Bodyweight":false, "HIIT":false, "Personal Training":false, "Yoga":false]
            return defaultValues
        }
        return defaultValues
    }
    
    // MARK: - Online location
    func updateCoordinates(latitude: Double, longitude: Double, email: String, accountUID: String) {
        let profile: [String:Any] = ["latitude": latitude, "longitude": longitude, "email": email]
        self.trainersRef.child(accountUID).updateChildValues(profile)
    }
    
    func removeOnlineStatus(uid: String) {
        self.trainersRef.child(uid).removeValue { (err, reference) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    /*
     // MARK: - Phone
     
     // create call
     func createCall(trainer: Trainer, user: User, dictionary: Dictionary<String,Any>) {
     let trainerUID = trainer.uid
     let trainerEmail = trainer.email
     let userUID = user.uid
     let userEmail = user.email
     var senderDict = dictionary
     var recipientDict = dictionary
     recipientDict.updateValue(userEmail, forKey: "email")
     recipientDict.updateValue(userUID, forKey: "seekerUID")
     senderDict.updateValue(trainerEmail, forKey: "email")
     senderDict.updateValue(trainerUID, forKey: "trainerUID")
     let childUpdates = ["\(trainerUID)/Phone/Incoming": recipientDict,
     "\(userUID)/Phone/Calling": senderDict]
     self.usersRef.updateChildValues(childUpdates)
     }
     
     // call accept
     func callAccept(trainer: Trainer, user: User) {
     let userUID = user.uid
     let trainerUID = trainer.uid
     let senderDict: [String: String] = ["Accepted": ""]
     let recipientDict: [String: String] = ["Accepted": ""]
     let childUpdates = ["\(trainerUID)/Phone": recipientDict,
     "\(userUID)/Phone": senderDict]
     self.usersRef.updateChildValues(childUpdates)
     }
     
     // call cancel
     func callCancelled(trainer: Trainer, user: User) {
     let userUID = user.uid
     let trainerUID = trainer.uid
     let senderDict: [String: String] = ["Ended": ""]
     let recipientDict: [String: String] = ["Ended": ""]
     let childUpdates = ["\(trainerUID)/Trainer/Phone/Incoming": recipientDict,
     "\(userUID)/Seeker/Phone/Calling": senderDict]
     self.usersRef.updateChildValues(childUpdates)
     }
     
     // MARK: - Messaging
     func sendMessage(recipientUID: String, recipientEmail: String, senderUID: String, senderEmail: String, messageBody: String) {
     let messageID = self.createUniqueID()
     let sentDetails = ["toUID": recipientUID,
     "to": recipientEmail,
     "body": messageBody]
     let receiveDetails = ["fromUID": senderUID,
     "from": senderEmail,
     "body": messageBody]
     let childUpdates = ["\(recipientUID)/inbox/received/\(messageID)": receiveDetails,
     "\(senderUID)/sent/\(messageID)": sentDetails]
     self.usersRef.updateChildValues(childUpdates)
     }
     */
    
}

extension DataService: OfflineDelegate {
    func didGoOffline(email: String) {
        self.trainersRef.child(email).removeValue { (err, reference) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
        }
    }
}
