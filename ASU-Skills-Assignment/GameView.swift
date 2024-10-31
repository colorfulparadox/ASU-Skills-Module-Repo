//
//  ContentView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/30/24.how
//

import SwiftUI

struct GameView: View {
    
    @State var clicker = Clicker()
    @State var newHighScore = false
    @State var newHighScoreBeingSet = false
    
    var body: some View {
        NavigationView {
            VStack {
                //Spacer()
                
                Text("Click the button!")
                    .font(.headline)
                    .padding(.bottom, 25.0)
                
                Button(action: {
                    Clicked(clicker: &clicker)
                }) {
                    Text("Click me!")
                }
                .onAppear {
                    clicker = CreateClicker()
                }
                .buttonStyle(.borderedProminent)
                
                
                Text("Your clicks so far: \(clicker.score)" )
                    .font(.system(size: 24, weight: .bold, design: .default))
                
                if clicker.score > clicker.highscore && !newHighScore {
                    
                    Text("You reached a new highscore of \(clicker.score)!!!")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .background(Color.red)
                        .transition(.slide)
                        .animation(.easeIn, value: 0.5)
                        .padding(.bottom, 25.0)
                        .onAppear {
                            if newHighScoreBeingSet {
                                return
                            }
                            newHighScoreBeingSet = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {  SetNewHighScore(clicker: &clicker)
                                newHighScore = true
                            }
                        }
                }
                else if newHighScore == true {
                    Text("This is your current highscore!!!")
                        .font(.system(size: 14, weight: .light, design: .default))
                        .padding(.bottom, 25.0)
                }
                else if newHighScore == false {
                    Text("Your highscore: \(GetClickerHighScore(clicker: clicker))")
                        .font(.subheadline)
                        .padding(.bottom, 25.0)
                }
                
                NavigationLink(destination: MenuView().navigationBarBackButtonHidden(true)) {
                    Text("Return to Menu")
                        .font(.system(size: 12, weight: .bold, design: .default))
                        .padding(.top, 10)
                }
                .onDisappear {
                    SaveHighScore(clicker: &clicker)
                }
                
            }
            .padding()
        }
    }
    
}

#Preview {
    GameView()
}
