//
//  MenuView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/31/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Button Clicker")
                    .font(.title)
                
                NavigationLink(destination: GameView().navigationBarBackButtonHidden(true)) {
                    Text("Play Game")
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    ResetHighScore()
                }) {
                    Text("Reset Score")
                        .font(.subheadline)
                }
                .buttonStyle(.bordered)
                .padding(.top, 35.0)
            }
        }
        .padding()
    }
}

#Preview {
    MenuView()
}
