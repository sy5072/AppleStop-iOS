//
//  Notification.swift
//  AppleStop
//
//  Created by Seungyun Kim on 2022/04/12.
//


import Foundation
import UserNotifications
import SwiftUI

struct Notification {
    var id : String
    var title : String
}

class NotificationManager {
   
    var notifications = [Notification]()
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert , .badge , .alert]) { granted, error in
                if granted == true && error == nil {
                    
                }
            }
    }
    
    func addNotification(title: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }
    
    func schedule() -> Void {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined :
                self.requestPermission()
            case .authorized, .provisional :
                self.scheduleNotifications()
           // case .denied :
          //      showAlert = true
            default :
                break
            }
        }
    }
    
    func scheduleNotifications() -> Void {
       
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            
            content.sound = UNNotificationSound.default
            content.subtitle = "오늘 분리수거 하셨나요?"
            content.body = "열심히 합시다아아아아아아아아"
            content.badge = 1
//            content.summaryArgument = "Alan Walker"
//            content.summaryArgumentCount = 40
            
            var date = DateComponents()
            date.hour = 09
            date.minute = 00
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
//         Test용 3초뒤 알람
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return}
                print("Scheduling notification with id : \(notification.id)")
            }
        }
    }
}
