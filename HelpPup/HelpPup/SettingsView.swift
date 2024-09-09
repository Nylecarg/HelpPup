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
            NavigationStack{
                ZStack{
                    Image("setbg")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(x: 0.4)
                    VStack {
                        Text("Hello, world!")
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}
#Preview {
    SettingsView()
}

