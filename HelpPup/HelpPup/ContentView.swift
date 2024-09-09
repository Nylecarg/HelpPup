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
                        Text("Wise words")
                            .font(.custom("DIN Alternate", size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if showMoodInput {
                            MoodInputBox(isPresented: $showMoodInput) { moodScore in
                                moodTracker.addMoodEntry(moodScore: moodScore)
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
        }
        .onAppear {
            showMoodInput = true
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
}

#Preview {
    ContentView()
}
