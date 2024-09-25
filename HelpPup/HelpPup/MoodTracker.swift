//
//  MoodTracker.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import Foundation

class MoodTracker: ObservableObject {
    static let shared: MoodTracker = .init()
    
    @Published var moodEntries: [MoodEntry] = []
    
    private let key = "MoodEntries"
    
    init() {
        loadMoodEntries()
        checkAndResetWeeklyData()
    }
    
    func addMoodEntry(happiness: Int, sadness: Int, anger: Int) {
        let newEntry = MoodEntry(date: Date(), happiness: happiness, sadness: sadness, anger: anger)
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
    
    func hasTrackedMoodToday() -> Bool {
        guard let lastEntry = moodEntries.last else { return false }
        let calendar = Calendar.current
        return calendar.isDateInToday(lastEntry.date)
    }
   
    func checkAndResetWeeklyData() {
        let calendar = Calendar.current
        guard let lastEntry = moodEntries.last else { return }
 
        if calendar.component(.weekday, from: Date()) == 1 {
            if !calendar.isDate(lastEntry.date, equalTo: Date(), toGranularity: .weekOfYear) {
                resetWeeklyData()
            }
        }
    }
    
    func resetWeeklyData() {
        moodEntries.removeAll()
        saveMoodEntries()
    }
}

struct MoodEntry: Identifiable, Codable {
    var id = UUID()
    let date: Date
    let happiness: Int
    let sadness: Int
    let anger: Int
    
    var totalMoodScore: Int {
        return happiness - sadness + anger
    }
}
