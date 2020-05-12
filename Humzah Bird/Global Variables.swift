//
//  Global Variables.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation

enum SceneTypes {
    case Game
    case MainMenu
}

enum POVType {
    case Behind
    case Left
    case Right
}

var lastYIncrement: Float = 0.0
var startingNextSpawnZ: Float = 50.0
var nextSpawnZ: Float = startingNextSpawnZ
var currentScore: Int = 0
var highScore: Int = 0
var minYIncrement: Float = -5.0
var maxYIncrement: Float = 5.0

struct defaultsKeys {
    static let highScore = "highScore"
}

let defaults = UserDefaults.standard
