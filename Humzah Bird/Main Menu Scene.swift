//
//  Main Menu Scene.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

extension GameViewController {
    
    func loadMainMenuScene() {
        highScore = defaults.integer(forKey: defaultsKeys.highScore)
        
        mainMenuScene = SCNScene(named: "art.scnassets/Main Menu.scn")!
        
        let tempShip = mainMenuScene!.rootNode.childNode(withName: "ship", recursively: true)
        
        tempShip?.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1.0)), forKey: "rotateAboutYAxis")
        
        let textNode = mainMenuScene!.rootNode.childNode(withName: "titleText", recursively: true)
        
        mainMenuHighScoreTextNode = mainMenuScene!.rootNode.childNode(withName: "highScoreText", recursively: true)
        if let textGeometry = mainMenuHighScoreTextNode!.geometry as? SCNText {
            textGeometry.string = "High Score: \(highScore)"
        }
        let temp = mainMenuHighScoreTextNode!.scale.x * (mainMenuHighScoreTextNode!.boundingBox.max.x - mainMenuHighScoreTextNode!.boundingBox.min.x)
        mainMenuHighScoreTextNode!.position = SCNVector3(-temp/2.0, 3, -6.5)
        
        let moveForward = SCNAction.move(to: SCNVector3(-2.896, 1.0, -6.000), duration: 0.5)
        moveForward.timingMode = .easeInEaseOut
        let moveBackward = SCNAction.move(to: SCNVector3(-2.896, 1.0, -7.0), duration: 0.5)
        moveBackward.timingMode = .easeInEaseOut
        textNode?.runAction(SCNAction.repeatForever(SCNAction.sequence([moveForward, moveBackward])), forKey: "moveBackAndForth")
        
        let moveUp = SCNAction.moveBy(x: 0.0, y: 0.5, z: 0.0, duration: 0.5)
        moveUp.timingMode = .easeInEaseOut
        let moveDown = SCNAction.moveBy(x: 0.0, y: -0.5, z: 0.0, duration: 0.5)
        moveDown.timingMode = .easeInEaseOut
        mainMenuHighScoreTextNode?.runAction(SCNAction.repeatForever(SCNAction.sequence([moveUp, moveDown])), forKey: "moveUpAndDown")
        
        // retrieve the SCNView
        scnView = self.view as? SCNView
        
        // set the scene to the view
        scnView!.scene = mainMenuScene
        
        // show statistics such as fps and timing information
        scnView!.showsStatistics = true
        
        // configure the view
        scnView!.backgroundColor = UIColor.black
        
        // allow hook for frame update logic
        scnView!.delegate = self
        
        //scnView!.allowsCameraControl = true
    }
    
    func displayMainMenuScene() {
        scnView!.present(
          mainMenuScene!,
          with: SKTransition.crossFade(withDuration: 0.1),
          incomingPointOfView: nil,
          completionHandler: nil
        )
        
        scnView!.overlaySKScene = nil
        if let textGeometry = mainMenuHighScoreTextNode!.geometry as? SCNText {
            textGeometry.string = "High Score: \(highScore)"
        }
        
        let temp = mainMenuHighScoreTextNode!.scale.x * (mainMenuHighScoreTextNode!.boundingBox.max.x - mainMenuHighScoreTextNode!.boundingBox.min.x)
        mainMenuHighScoreTextNode!.position = SCNVector3(-temp/2.0, 3, -6.5)
    }
}
