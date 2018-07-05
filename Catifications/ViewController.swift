//
//  ViewController.swift
//  Newtifications
//
//  Created by IURII PETUKHOV on 04/07/2018.
//  Copyright © 2018 GypsiOS. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBAction func sendNotificationPressed(_ sender: UIButton) {
        sendLocalNotification()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationCategories()
    }
    
    func setupNotificationCategories() {
        let actions = [
            UNNotificationAction(identifier: "like-action",  title: "Like", options: []),
            UNNotificationAction(identifier: "open-app",  title: "Open Application", options: []),
            UNNotificationAction(identifier: "dismiss",  title: "Dismiss", options: []),
            ]
        
        let simpleCategory = UNNotificationCategory(identifier: "category-simple", actions: actions, intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([simpleCategory])
    }

    func sendLocalNotification() {
        UNUserNotificationCenter.current().getNotificationSettings {
            (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            let content = UNMutableNotificationContent()
            content.title = "Cat Title"
            content.subtitle = "Cat Subtitle"
            content.body = "Cat Body"
            content.sound = .default
            content.categoryIdentifier = "category-simple"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let uuid = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                (error) in
                
            })
        }
    }
    
}

