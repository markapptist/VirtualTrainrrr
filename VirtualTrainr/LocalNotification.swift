//
//  LocalNotification.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 28/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotification: NSObject {
    private static let _instance = LocalNotification()
    
    // public instance
    static var instance: LocalNotification {
        return _instance
    }
    
    func setNotification(title: String, body: String, timeInterval: TimeInterval) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let identifier = "notification"
        let notificationRequest = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        return notificationRequest
    }
    
    func createNotification(center: UNUserNotificationCenter, request: UNNotificationRequest) {
        center.add(request) { (error) in
            if let error = error {
                
            }
            else {
                
            }
        }
    }
    
}

