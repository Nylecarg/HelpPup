//
//  SettingsView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 15/7/24.
//

import SwiftUI
struct SettingsView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("setbg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(x: -28)
                
                List {
                    Text("Referral")
                    Text("Notifications")
                    Text("Data and privacy")
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Settings")
        }
    }
}
#Preview {
    SettingsView()
}

