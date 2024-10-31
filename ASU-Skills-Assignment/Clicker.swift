//
//  Clicker.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/31/24.
//

import Foundation

struct Clicker {
    var score: Int = 0
    var highscore: Int = 3
}

func CreateClicker() -> Clicker {
    var clicker: Clicker = Clicker()
    
    guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("Not able to access the document directory")
    }
    
    let file = dir.appendingPathComponent("HighScore")
    
    do {
        let readString = try String(contentsOf: file, encoding: .utf8)
        if let readScore = Int(readString) {
            clicker.highscore = readScore
            //print("Highscore set to \(clicker.highscore)")
        } else {
            print("HighScore could not be converted to an Int! input was: [\(readString)]")
        }
    } catch {
        print("Failed to read from file: \(file). Error: \(error.localizedDescription)")
    }
    
    return clicker
}

func Clicked(clicker: inout Clicker) -> Void {
    clicker.score += 1
}

func GetClickerHighScore(clicker: Clicker) -> Int {
    return clicker.highscore
}

func SetNewHighScore(clicker: inout Clicker) -> Void {
    clicker.highscore = clicker.score
}

func SaveHighScore(clicker: inout Clicker) -> Void {
    guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("Not able to access the document directory")
    }
    let file = dir.appendingPathComponent("HighScore")
    
    if clicker.score > clicker.highscore {
        clicker.highscore = clicker.score
    }
    
    let scoreString = "\(clicker.highscore)"
    
    do {
        try scoreString.write(to: file, atomically: true, encoding: .utf8)
    } catch {
        assertionFailure("Failed to write to file: \(file). Error: \(error.localizedDescription)")
    }
}

func ResetHighScore() {
    guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("Not able to access the document directory")
    }
    let file = dir.appendingPathComponent("HighScore")
    
    do {
        try "0".write(to: file, atomically: true, encoding: .utf8)
    } catch {
        assertionFailure("Failed to write to file: \(file). Error: \(error.localizedDescription)")
    }
}
