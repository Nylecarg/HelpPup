//
//  MoodScoreView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI
import Charts

struct MoodScoreView: View {
    @ObservedObject var moodTracker: MoodTracker = .shared
    
    var body: some View {
        VStack {
            Text("Today is \(getFormattedDate(date: Date()))")
                   .font(.headline)
                   .padding()
            
            if moodTracker.moodEntries.isEmpty {
                Text("No mood data available for analysis.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                BarChart(moodEntries: moodTracker.moodEntries)
                    .frame(height: 200)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Mood Analytics")
    }
    func getFormattedDate(date: Date) -> String {
       let formatter = DateFormatter()
       formatter.dateStyle = .full
       return formatter.string(from: date)
   }
}

struct BarChart: View {
    var moodEntries: [MoodEntry]
    
    var body: some View {
        Chart {
            ForEach(getWeekdaysWithMoodEntries(), id: \.0) { (dayName, entry) in
                if let entry = entry {
                    BarMark(
                        x: .value("Day", dayName),
                        y: .value("Happiness", entry.happiness)
                    )
                    .foregroundStyle(.yellow)
                    
                    BarMark(
                        x: .value("Day", dayName),
                        y: .value("Sadness", entry.sadness)
                    )
                    .foregroundStyle(.blue)
                    
                    BarMark(
                        x: .value("Day", dayName),
                        y: .value("Anger", entry.anger)
                    )
                    .foregroundStyle(.red)
                } else {
                    BarMark(
                        x: .value("Day", dayName),
                        y: .value("Empty", 0)
                    )
                    .opacity(0)
                }
            }
        }
        .chartXAxis {
            AxisMarks(values: getWeekdayNames())
        }
    }

    func getWeekdaysWithMoodEntries() -> [(String, MoodEntry?)] {
        let daysOfWeek = getWeekdayNames()
        var result: [(String, MoodEntry?)] = []
        let calendar = Calendar.current
        let currentWeekDates = getCurrentWeekDates()
        
        for (index, dayName) in daysOfWeek.enumerated() {
            if let entry = moodEntries.first(where: { calendar.isDate($0.date, inSameDayAs: currentWeekDates[index]) }) {
                result.append((dayName, entry))
            } else {
                result.append((dayName, nil))
            }
        }
        return result
    }
    
    func getWeekdayNames() -> [String] {
        return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    }
    
    func getCurrentWeekDates() -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let daysToSubtract = weekday - 1
        let startOfWeek = calendar.date(byAdding: .day, value: -daysToSubtract, to: today)!
        
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}
