//
//  Clicker.swift
//  ASU-Skills-Assignment
//
//  Created by Preston Wilson on 10/31/24.
//


struct Clicker {
    var score = 0
    var highscore = 10
}

func CreateClicker() -> Clicker {
    let clicker = Clicker()
    return clicker
}

func Clicked(clicker: (inout Clicker)) -> Void {
    clicker.score += 1
}

func GetClickerHighScore(clicker: Clicker) -> Int {
    if clicker.score > clicker.highscore {
        return clicker.score
    }
    return clicker.highscore
}
