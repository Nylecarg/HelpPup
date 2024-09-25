//
//  RemindersSettingsView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 16/9/24.
//

import SwiftUI
import UserNotifications

struct ReminderSettingsView: View {
    let reminderType: String
    @State private var selectedDate = Date()
    @State private var recurrence: Recurrence = .daily
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Customise \(reminderType) Reminder")
                .font(.headline)
                .padding()
            
            DatePicker("Pick time", selection: $selectedDate, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Picker("Recurrence", selection: $recurrence) {
                Text("Daily").tag(Recurrence.daily)
                Text("Weekly").tag(Recurrence.weekly)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button(action: {
                checkNotificationPermission {
                    scheduleNotification()
                }
            }) {
                Text("Schedule Reminder")
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Notification Scheduled"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "\(reminderType) Reminder"
        content.body = "It's time for your \(reminderType.lowercased())!"
        content.sound = .default
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: selectedDate)
        
        let trigger: UNCalendarNotificationTrigger
        
        switch recurrence {
        case .daily:
            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        case .weekly:
            var weeklyComponents = components
            weeklyComponents.weekday = calendar.component(.weekday, from: Date())
            trigger = UNCalendarNotificationTrigger(dateMatching: weeklyComponents, repeats: true)
        }

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    alertMessage = "Your \(reminderType) reminder has been scheduled."
                    showAlert = true
                }
            }
        }
    }

    func checkNotificationPermission(completion: @escaping () -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                completion()
            } else {
                DispatchQueue.main.async {
                    alertMessage = "Please enable notifications in Settings."
                    showAlert = true
                }
            }
        }
    }
}

enum Recurrence: String {
    case daily = "Daily"
    case weekly = "Weekly"
}

#Preview {
    ReminderSettingsView(reminderType: "Water")
}
