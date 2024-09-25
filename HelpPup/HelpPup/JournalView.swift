//
//  JournalView.swift
//  HelpPup
//
//  Created by Gracelyn Gosal on 28/8/24.
//

import SwiftUI

struct JournalView: View {
    @State private var journalText: String = ""

    var body: some View {
        TextEditor(text: $journalText)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .cornerRadius(30)
            .shadow(radius: 5)
            .navigationTitle("Journal")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    JournalView()
}

