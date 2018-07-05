//
//  NotificationViewController.swift
//  Notification Extension
//
//  Created by IURII PETUKHOV on 04/07/2018.
//  Copyright © 2018 GypsiOS. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func defaultButtonTapped(_ sender: UIButton) {
        openApp()
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        likeButton.setTitle("♥", for: .normal)
    }
    
    func openApp() {
        extensionContext?.performNotificationDefaultAction()
    }
    
    func dismissNotification() {
        extensionContext?.dismissNotificationContentExtension()
    }
    
    func didReceive(_ notification: UNNotification) {
        self.notificationTitleLabel.text = notification.request.content.body
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        switch response.actionIdentifier {
        case "like-action":
            let actions = [
                UNNotificationAction(identifier: "1-star",  title: "★", options: []),
                UNNotificationAction(identifier: "2-star",  title: "★ ★", options: []),
                UNNotificationAction(identifier: "3-star",  title: "★ ★ ★", options: []),
                ]
            extensionContext?.notificationActions = actions
        case "open-app":
            openApp()
        default:
            dismissNotification()
        }
    }
    
}
