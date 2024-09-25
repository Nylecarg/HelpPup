//
//  RemindersView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI
import UserNotifications

struct RemindersView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: ReminderSettingsView(reminderType: "Food")) {
                Text("Food")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: ReminderSettingsView(reminderType: "Water")) {
                Text("Water")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: ReminderSettingsView(reminderType: "Break")) {
                Text("Break")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: ReminderSettingsView(reminderType: "Motivate")) {
                Text("Motivate")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
                .navigationTitle("Reminders")
                .navigationBarTitleDisplayMode(.large)
        }
        .padding()
    }
}

#Preview {
    RemindersView()
}
