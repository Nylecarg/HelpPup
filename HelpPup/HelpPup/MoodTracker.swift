//
//  MoodTracker.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import Foundation

class MoodTracker: ObservableObject {
    static let shared: MoodTracker = .init()
    
    @Published var moodEntries: [MoodEntry] = [
        MoodEntry(date: Date(), moodScore: 3),
        MoodEntry(date: Date().addingTimeInterval(-86400), moodScore: 4),
        MoodEntry(date: Date().addingTimeInterval(-86400 * 2), moodScore: 2)
    ]
    
    private let key = "MoodEntries"
    
    init() {
        loadMoodEntries()
    }
    
    func addMoodEntry(moodScore: Int) {
        let newEntry = MoodEntry(date: Date(), moodScore: moodScore)
        moodEntries.append(newEntry)
        saveMoodEntries()
    }
    
    func saveMoodEntries() {
        if let encoded = try? JSONEncoder().encode(moodEntries) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func loadMoodEntries() {
        if let savedData = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([MoodEntry].self, from: savedData) {
            moodEntries = decoded
        }
    }
    
    func weeklyAnalysis() -> String {
        let totalMood = moodEntries.reduce(0) { $0 + $1.moodScore }
        let averageMood = Double(totalMood) / Double(moodEntries.count)
        return "Your average mood this week is \(averageMood)"
    }
    
    func resetWeeklyData() {
        moodEntries.removeAll()
        saveMoodEntries()
    }
}

struct MoodEntry: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let moodScore: Int
}

