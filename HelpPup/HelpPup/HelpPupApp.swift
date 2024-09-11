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
