//
//  Player.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 6/12/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import SwiftUI
import Foundation

class Player: ObservableObject {
    
    static func load() -> Player {
        let tempHighScore = LoadInt(key: SaveKeys.highScore, defaultValue: 0)
        let tempUUID = LoadUUID(key: SaveKeys.uuid)
        let tempSumOfScores = LoadInt(key: SaveKeys.sumOfScores, defaultValue: 0)
        let tempTimesPlayed = LoadInt(key: SaveKeys.timesPlayed, defaultValue: 0)
        return Player(highestScore: tempHighScore, uniqueUserID: tempUUID, numTimesPlayed: tempTimesPlayed, totalSumOfScores: tempSumOfScores)
    }
    
    @Published var currentSceneInt: Int
    @Published var currentScore: Int
    @Published var highScore: Int
    @Published var sumOfScores: Int
    @Published var timesPlayed: Int
    var uuid: UUID
    
    init() {
        uuid = UUID()
        highScore = 0
        sumOfScores = 0
        timesPlayed = 0
        currentScore = 0
        currentSceneInt = 0
    }
    
    init(highestScore: Int) {
        highScore = highestScore
        uuid = UUID()
        sumOfScores = 0
        timesPlayed = 0
        currentScore = 0
        currentSceneInt = 0
    }
    
    init(highestScore: Int, uniqueUserID: UUID) {
        highScore = highestScore
        uuid = uniqueUserID
        sumOfScores = 0
        timesPlayed = 0
        currentScore = 0
        currentSceneInt = 0
    }
    
    init(highestScore: Int, uniqueUserID: UUID, numTimesPlayed: Int, totalSumOfScores: Int) {
        highScore = highestScore
        uuid = uniqueUserID
        currentScore = 0
        timesPlayed = numTimesPlayed
        sumOfScores = totalSumOfScores
        currentSceneInt = 0
    }
    
    func save() {
        SaveInt(key: SaveKeys.highScore, value: self.highScore)
        SaveUUID(key: SaveKeys.uuid, value: self.uuid)
        SaveInt(key: SaveKeys.sumOfScores, value: self.sumOfScores)
        SaveInt(key: SaveKeys.timesPlayed, value: self.timesPlayed)
    }
}
