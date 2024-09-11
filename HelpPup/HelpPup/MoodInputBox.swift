//
//  MoodInputBox.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI

struct MoodInputBox: View {
    @Binding var isPresented: Bool
    @State private var selectedMood: Double = 1.0

    var saveMood: (Int) -> Void
    
    var body: some View {
        VStack {
            Text("Current mood")
                .foregroundStyle(.black)
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            Text("☹️       😐       🙂       😃")
                .font(.largeTitle)
                .padding(.bottom, -15)
            
            Slider(value: $selectedMood, in: 1.0...10.0, step: 1.0)
                .accentColor(.yellow)
                .padding(5)
            
            Button(action: {
                saveMood(Int(selectedMood))
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
        .background(Color.teal.opacity(0.7))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    MoodInputBox(isPresented: .constant(true), saveMood: { _ in })
}
