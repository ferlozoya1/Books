//
//  currentBookView.swift
//  Books
//
//  Created by Fernanda Lozoya Navarro on 16/11/23.
//

import SwiftUI

struct CurrentBookView: View {
    @Binding var elapsedTime: TimeInterval
    
    var body: some View {
        Text("Tiempo transcurrido: \(formattedTime(elapsedTime))")
            .padding()
        
    }
    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    CurrentBookView(elapsedTime: .constant(.init()))
}
