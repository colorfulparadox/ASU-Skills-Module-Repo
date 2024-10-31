//
//  ContentView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/30/24.how
//

import SwiftUI

struct GameView: View {
    
    @State var clicker = CreateClicker()
    @State var newHighScore = false
    
    var body: some View {
        VStack {
            //Spacer()
            
            Text("Click the button!")
                .font(.headline)
                .padding(.bottom, 25.0)
            
            Button(action: {
                Clicked(clicker: &clicker)
                
                if clicker.score > clicker.highscore+1 {
                    newHighScore = true
                }
            }) {
                Text("Click me!")
            }
            .buttonStyle(.borderedProminent)
            
            
            Text("Your clicks so far: \(clicker.score)" )
            if clicker.score > clicker.highscore && !newHighScore {
                
                Text("You reached a new highscore of \(clicker.score)!!!")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .background(Color.red)
                    .transition(.opacity)
            }
            else if newHighScore == true {
                Text("This is your current highscore!!!")
                    .font(.system(size: 14, weight: .light, design: .default))
            }
            else if newHighScore == false {
                Text("Your highscore: \(GetClickerHighScore(clicker: clicker))")
                    .font(.subheadline)
            }
            
        }
        .padding()
    }
    
}

#Preview {
    GameView()
}
