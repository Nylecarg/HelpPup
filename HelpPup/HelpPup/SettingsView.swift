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
                        .aspectRatio(contentMode: .fill)
                        .position(x: geometry.size.width / 2, y: 426)
                        .ignoresSafeArea()
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

