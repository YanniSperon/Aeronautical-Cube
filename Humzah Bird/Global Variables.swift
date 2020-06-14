//
//  Global Variables.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation

struct Scene {
    static let MainMenu = 0
    static let Game = 1
    static let Statistics = 2
    static let Settings = 3
}

enum POVType {
    case Behind
    case Left
    case Right
}

var currentPlayer: Player?
var lastYIncrement: Float = 0.0
var startingNextSpawnZ: Float = 50.0
var nextSpawnZ: Float = startingNextSpawnZ
var minYIncrement: Float = -5.0
var maxYIncrement: Float = 5.0
var gameViewController: GameViewController?
