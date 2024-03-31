//
//  NotificationManager.swift
//  ClimateEye
//
//  Created by Aakash  Bondwal  on 22/10/23.
//


import Foundation
import UserNotifications
import WeatherKit


class NotificationManager {
    static let instance = NotificationManager()
    
    let weather = [HourWeather]()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    
    
    func scheduleNotifications(title: String, subtitle: String) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = .default
        content.badge = 1

        
//        notifcation everyday
        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 00

        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
