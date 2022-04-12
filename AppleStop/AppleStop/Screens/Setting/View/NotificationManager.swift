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
        print("permission")
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert , .badge , .alert]) { granted, error in
                if granted == true && error == nil {
                    print("granted")
                } else {
                    print("not granted")
                }
            }
    }
    
    func addNotification(title: String) -> Void {
        print("add")
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }

    
    func schedule() -> Void {
        print("schedule!!")
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined :
                self.requestPermission()
            case .authorized, .provisional :
                self.scheduleNotifications(isOn: true)
         
            default :
                break
            }
        }
    }
    
    func scheduleNotifications(isOn: Bool) -> Void {
       
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            
            content.sound = UNNotificationSound.defaultCritical
            content.subtitle = "오늘 분리수거 하셨나요?"
            content.body = "열심히 합시다아아아아아아아아"
            content.badge = 0

            
            var date = DateComponents()
            date.hour = 09
            date.minute = 00
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
            
//         Test용 3초뒤 알람
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            if isOn {
                UNUserNotificationCenter.current().add(request) { error in
                    guard error == nil else { return}
                    print("Scheduling notification with id : \(notification.id)")
                }
            } else {
                print("removeall!!")
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                
            }
            
            
        }
    }
}
