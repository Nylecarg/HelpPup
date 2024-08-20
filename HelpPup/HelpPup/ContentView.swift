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
        GeometryReader { geometry in
            NavigationStack{
                ZStack{
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .position(x: geometry.size.width / 2, y: 426)
                        .ignoresSafeArea()
                    VStack {
                        Text("hello")
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
                        Spacer()
                            .frame(height: 400)
                    } .padding()
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.large)
                        .toolbar {
                            NavigationLink(destination: SettingsView()) {     Image(systemName: "gear") }
                        }
                }
            }
        }
    }
    func navigationTile(name: buttons) -> some View {
        NavigationLink(value: name) {
            HStack {
                Text("\(name.string)")
                    .minimumScaleFactor(0.1)
                    .font(.system(size: 23))
                    .frame(width: 115, height: 50)
                    .bold()
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
