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
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    navigationTile(name: .reminders)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    navigationTile(name: .moodScore)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                HStack {
                    navigationTile(name: .selfCare)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    navigationTile(name: .journal)
                        .background(Color.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            } .padding()
            Spacer()
                .frame(height: 400)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                NavigationLink(destination: SettingsView()) {     Image(systemName: "gear") }
            }
        }
    }
    func navigationTile(name: buttons) -> some View {
        NavigationLink(value: name) {
            HStack {
                Text("\(name.string)")
                    .minimumScaleFactor(0.1)
                    .font(.system(size: 23))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            }
            .padding(30)
            .foregroundStyle(.white)
        }
        .buttonStyle(.plain)
    }
}
#Preview {
    ContentView()
}
