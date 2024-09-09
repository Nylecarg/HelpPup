//
//  MoodScoreView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI

struct MoodScoreView: View {
    @ObservedObject var moodTracker: MoodTracker = .shared
    
    var body: some View {
        VStack {
            Text("Mood Analytics")
                .font(.headline)
                .padding()
            
            if moodTracker.moodEntries.isEmpty {
                Text("No mood data available for analysis.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                LineGraph(moodEntries: moodTracker.moodEntries)
                    .frame(height: 200)
                    .padding()
            }
            
            Text(moodTracker.weeklyAnalysis())
                .font(.body)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Mood Analytics")
    }
}


import Charts

struct LineGraph: View {
    var moodEntries: [MoodEntry]
    
    var body: some View {
        Chart(moodEntries) { entry in
            LineMark(
                x: .value("Day", entry.date),
                y: .value("Mood Score", entry.moodScore)
            )
        }
    }
}

#Preview {
    MoodScoreView(moodTracker: MoodTracker())
}

