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
        if (currentScene == .Game) {
            for node in gameScene!.rootNode.childNodes {
                if ((node.name!.contains("Obstacle")) && (node.presentation.position.z + 1.0) <= ship!.presentation.position.z) {
                    if (lastYIncrement < 0.005 && lastYIncrement > -0.005) {
                        lastYIncrement = Float.random(in: minYIncrement...maxYIncrement)
                        var startingYPosition: Float = -40.0
                        if (node.name!.contains("top")) {
                            startingYPosition = 65.0
                            currentScore += 1
                            scoreTextNode!.attributedText = NSAttributedString(string: "Score: \(currentScore)", attributes: [.font: UIFont.systemFont(ofSize: 36.0), .foregroundColor: UIColor.white])
                        }
                        node.position.y = startingYPosition + lastYIncrement
                    } else {
                        var startingYPosition: Float = -40.0
                        if (node.name!.contains("top")) {
                            startingYPosition = 65.0
                            currentScore += 1
                            scoreTextNode!.attributedText = NSAttributedString(string: "Score: \(currentScore)", attributes: [.font: UIFont.systemFont(ofSize: 36.0), .foregroundColor: UIColor.white])
                        }
                        node.position.y = startingYPosition + lastYIncrement
                        lastYIncrement = 0.0
                    }
                    node.position.z = nextSpawnZ
                    if (currentScore > highScore) {
                        highScore = currentScore
                        defaults.set(highScore, forKey: defaultsKeys.highScore)
                    }
                }
            }
            // process events
            for _ in events {
                let event = events.popLast()
                if event is BirdDeathEvent {
                    print("bird death event")
                    currentScene = .MainMenu
                    scoreTextNode!.attributedText = NSAttributedString(string: "Score: 0", attributes: [.font: UIFont.systemFont(ofSize: 36.0), .foregroundColor: UIColor.white])
                    currentPOV = .Behind
                    scnView?.pointOfView = behindCameraNode
                    displayMainMenuScene()
                    event?.processEvent()
                    events.removeAll()
                    break
                }
            }
        }
    }
}
