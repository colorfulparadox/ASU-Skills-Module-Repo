//
//  ContentView.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //Spacer()
            
            Text("This is a button clicker app!")
                .font(.headline)
                .padding(.bottom, 25.0)
            
            Button(action: test) {
                Text("Click me!")
            }
            .buttonStyle(.borderedProminent)
            
            Text("Your clicks so far: %d")
                .font(.subheadline)
                
            
           // Spacer()
            
        }
        .padding()
    }
    
    func test() {
        
    }
}

#Preview {
    ContentView()
}
