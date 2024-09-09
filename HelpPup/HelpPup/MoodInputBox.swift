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
            Text("Rate your mood")
                .font(.headline)
                .padding(.bottom, 10)
            
            Slider(value: $selectedMood, in: 1.0...10.0, step: 1.0)
                .padding()
            
            Button(action: {
                saveMood(Int(selectedMood))
                isPresented = false
            }) {
                Text("Save Mood")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    MoodInputBox(isPresented: .constant(true), saveMood: { _ in })
}
