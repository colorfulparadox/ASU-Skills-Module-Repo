//
//  ContentView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/30/24.how
//

import SwiftUI

struct ContentView: View {
    
    @State var clicker = CreateClicker()
    @State var newHighScore = false
    
    var body: some View {
        VStack {
            //Spacer()
            
            Text("This is a button clicker app!")
                .font(.headline)
                .padding(.bottom, 25.0)
            
            Button(action: { Clicked(clicker: &clicker) }) {
                Text("Click me!")
            }
            .buttonStyle(.borderedProminent)
            
            
            Text("Your clicks so far: \(clicker.score)" )
            if clicker.score > clicker.highscore && !newHighScore {
                Text("You reached a new highscore of \(clicker.score)!!!")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .fixedSize(horizontal: true, vertical: true)
                    .background(Color.red)
                    .transition(.identity)
                    .animation(.easeIn, value: 1)
            }
            else {
                Text("Your highscore: \(GetClickerHighScore(clicker: clicker))")
                    .font(.subheadline)
            }
            
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
