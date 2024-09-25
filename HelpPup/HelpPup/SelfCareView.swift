//
//  SelfCareView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI

struct SelfCareView: View {
    var body: some View {
        VStack {
            Button(action: {
                // Action for Gratitude
            }) {
                Text("Gratitude")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.9))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .shadow(radius: 10)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                // Action for Breathing Exercises
            }) {
                Text("Breathing Exercises")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal.opacity(0.7))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .shadow(radius: 10)
            }
        }
        .padding()
        .navigationTitle("Self Care")
        Spacer()
    }
}

#Preview {
    SelfCareView()
}
