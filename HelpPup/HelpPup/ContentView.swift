//
//  ContentView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 15/7/24.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello, world!")
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                NavigationLink(destination: SettingsView()) {     Image(systemName: "gear") }
            }
        }
    }
}
#Preview {
    ContentView()
}
