//
//  MoodInputBox.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI

struct MoodInputBox: View {
    @Binding var isPresented: Bool
    @ObservedObject var moodTracker: MoodTracker = .shared
    @State private var happiness: Double = 5.0
    @State private var sadness: Double = 5.0
    @State private var anger: Double = 5.0
    
    var saveMood: (Int, Int, Int) -> Void
    
    var body: some View {
        VStack {
            Text("Rate your current emotions")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            emotionSliderView(emotion: "Happiness", value: $happiness, emoji: "😊")
            emotionSliderView(emotion: "Sadness", value: $sadness, emoji: "😢")
            emotionSliderView(emotion: "Angry", value: $anger, emoji: "😠")
            
            Button(action: {
                saveMood(Int(happiness), Int(sadness), Int(anger))
                isPresented = false
            }) {
                Text("Save Mood")
                    .padding(10)
                    .background(Color.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.teal.opacity(0.5))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    func emotionSliderView(emotion: String, value: Binding<Double>, emoji: String) -> some View {
        VStack {
            Text("\(emotion) \(emoji)")
                .font(.headline)
            Slider(value: value, in: 1.0...10.0, step: 1.0)
                .accentColor(.yellow)
                .padding(5)
        }
    }
}
