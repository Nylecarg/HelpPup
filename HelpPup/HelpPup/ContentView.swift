//
//  ContentView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 15/7/24.
//

import SwiftUI

enum buttons: Codable, Hashable, CaseIterable {
    case reminders, moodScore, selfCare, journal
    
    var string: String {
        switch self {
        case .reminders:
            return "Reminders"
        case .moodScore:
            return "Mood Score"
        case .selfCare:
            return "Self Care"
        case .journal:
            return "Journal"
        }
    }
}

struct ContentView: View {
    @State private var showMoodInput = false
    @ObservedObject var moodTracker: MoodTracker = .shared
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Image("bg")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(x: 0.1)
                    
                    VStack {
                        if showMoodInput {
                            MoodInputBox(isPresented: $showMoodInput) { happiness, sadness, anger in
                                moodTracker.addMoodEntry(happiness: happiness, sadness: sadness, anger: anger)
                            }
                            .transition(.move(edge: .top))
                        }
                        
                        HStack {
                            navigationTile(name: .reminders)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            navigationTile(name: .moodScore)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        HStack {
                            navigationTile(name: .selfCare)
                                .background(Color.yellow)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            navigationTile(name: .journal)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .navigationDestination(for: buttons.self) { destination in
                    switch destination {
                    case .reminders:
                        RemindersView()
                    case .moodScore:
                        MoodScoreView()
                    case .selfCare:
                        SelfCareView()
                    case .journal:
                        JournalView()
                    }
                }
            }
        }
        .onAppear {
            showMoodInput = !moodTracker.hasTrackedMoodToday()
            requestNotificationPermissions()
        }
    }
    
    func navigationTile(name: buttons) -> some View {
        NavigationLink(value: name) {
            HStack {
                Image("\(name.string)")
                    .resizable()
                    .scaledToFill()
            }
            .foregroundStyle(.white)
        }
        .buttonStyle(.plain)
        .frame(maxWidth: .infinity)
        .frame(height: 95)
    }
    
    func requestNotificationPermissions() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notifications permission: \(error)")
            } else {
                print("Notifications permission granted: \(granted)")
            }
        }
    }
}

#Preview {
    ContentView()
}

