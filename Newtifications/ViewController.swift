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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let simpleCategory = UNNotificationCategory(identifier: "category-simple", actions: [], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([simpleCategory])
    }

    @IBAction func sendNotificationPressed(_ sender: UIButton) {
        UNUserNotificationCenter.current().getNotificationSettings {
            (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            let content = UNMutableNotificationContent()
            content.title = "Simple Title"
            content.subtitle = "Simple Subtitle"
            content.body = "Simple Body"
            content.sound = .default
            content.categoryIdentifier = "category-simple"
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let uuid = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                (error) in
                //♡♥
                
            })
        }
    }
    
}

