//
//  BirdDeathEvent.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation

class BirdDeathEvent: Event {
    override init() {
        super.init()
    }
    
    override func processEvent() {
        if (currentScore > highScore) {
            highScore = currentScore
        }
        currentScore = 0
    }
}
