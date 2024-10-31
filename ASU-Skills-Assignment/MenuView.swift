//
//  MenuView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/31/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Text("Button Clicker")
                .font(.title)
            
            Button(action: {}) {
                Text("Play Game")
                    .font(.title)
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: {}) {
                Text("Reset Score")
                    .font(.subheadline)
            }
            .buttonStyle(.bordered)
            .padding(.top, 25.0)
        }
    }
}

#Preview {
    MenuView()
}
