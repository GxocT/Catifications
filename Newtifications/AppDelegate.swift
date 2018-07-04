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
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) {
            (granted, error) in
            
            if granted {
                
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
    }


}

