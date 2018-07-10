//
//  ViewController.swift
//  Newtifications
//
//  Created by IURII PETUKHOV on 04/07/2018.
//  Copyright © 2018 GypsiOS. All rights reserved.
//

import UIKit
import UserNotifications

private extension String {
    
    static let allCats = "all-cats"
    static let threeStarCats = "3-star-cats"
    
}

class ViewController: UIViewController {

    @IBAction func sendNotificationPressed(_ sender: UIButton) {
        sendLocalNotification(with: .allCats, summary: "Все Коты", count: 1)
    }
    
    @IBAction func send3StarsNotificationPressed(_ sender: UIButton) {
        sendLocalNotification(with: .threeStarCats, summary: "Избранные", count: 10)
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
        
        let summaryFormat = NSString.localizedUserNotificationString(forKey: "NOTIFICATION_SUMMARY",
                                                                     arguments: nil)
        
        let simpleCategory = UNNotificationCategory(identifier: "Cat-Category",
                                                    actions: actions,
                                                    intentIdentifiers: [.threeStarCats, .allCats],
                                                    hiddenPreviewsBodyPlaceholder: nil,
                                                    categorySummaryFormat: summaryFormat,
                                                    options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([simpleCategory])
    }

    func sendLocalNotification(with threadId: String, summary: String, count: Int) {
        UNUserNotificationCenter.current().getNotificationSettings {
            (settings) in
            
            guard settings.authorizationStatus == .authorized else { return }
            
            let content = UNMutableNotificationContent()
            content.title = "Cat Title"
            content.body = "Cat Body"
            content.sound = .default
            content.categoryIdentifier = "Cat-Category"
            
            content.threadIdentifier = threadId
            content.subtitle = "Thread ID: \(threadId)"
            
            content.summaryArgument = summary
            content.summaryArgumentCount = count
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let uuid = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request, withCompletionHandler: {
                (error) in
                
            })
        }
    }
    
}
