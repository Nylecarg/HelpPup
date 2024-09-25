//
//  HelpPupApp.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 15/7/24.
//

import SwiftUI
import UserNotifications

@main
struct HelpPupApp: App {
    let center = UNUserNotificationCenter.current()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound]) 
    }
}
