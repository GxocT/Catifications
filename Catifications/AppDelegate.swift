//
//  AppDelegate.swift
//  Newtifications
//
//  Created by IURII PETUKHOV on 04/07/2018.
//  Copyright © 2018 GypsiOS. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        registerNotifications()
        
        return true
    }

    func registerNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound, .providesAppNotificationSettings]) {
            (granted, error) in
            
            if granted {
                UNUserNotificationCenter.current().delegate = self
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        openSettings()
    }
    
    func openSettings() {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier: "Settings")
        window?.rootViewController = settingsVC
    }
    
}
