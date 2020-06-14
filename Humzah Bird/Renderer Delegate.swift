//
//  Renderer Delegate.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SceneKit

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if (currentPlayer!.currentSceneInt == Scene.Game) {
            for node in gameScene!.rootNode.childNodes {
                if ((node.name!.contains("Obstacle")) && (node.presentation.position.z + 1.0) <= ship!.presentation.position.z) {
                    if (lastYIncrement < 0.005 && lastYIncrement > -0.005) {
                        lastYIncrement = Float.random(in: minYIncrement...maxYIncrement)
                        var startingYPosition: Float = -40.0
                        if (node.name!.contains("top")) {
                            startingYPosition = 65.0
                            DispatchQueue.main.async {
                                currentPlayer!.currentScore += 1
                            }
                        }
                        node.position.y = startingYPosition + lastYIncrement
                    } else {
                        var startingYPosition: Float = -40.0
                        if (node.name!.contains("top")) {
                            startingYPosition = 65.0
                            DispatchQueue.main.async {
                                currentPlayer!.currentScore += 1
                            }
                        }
                        node.position.y = startingYPosition + lastYIncrement
                        lastYIncrement = 0.0
                    }
                    node.position.z = nextSpawnZ
                    if (currentPlayer!.currentScore > currentPlayer!.highScore) {
                        DispatchQueue.main.async {
                            currentPlayer!.highScore = currentPlayer!.currentScore
                            currentPlayer!.save()
                        }
                    }
                }
            }
            // process events
            for _ in events {
                let event = events.popLast()
                if event is BirdDeathEvent {
                    DispatchQueue.main.async {
                        print("bird death event")
                        currentPlayer!.currentSceneInt = Scene.MainMenu
                        self.currentPOV = .Behind
                        self.scnView?.pointOfView = self.behindCameraNode
                        self.displayMainMenuScene()
                        currentPlayer!.sumOfScores += currentPlayer!.currentScore
                        event?.processEvent()
                        currentPlayer!.save()
                    }
                    events.removeAll()
                    break
                }
            }
        }
    }
}
