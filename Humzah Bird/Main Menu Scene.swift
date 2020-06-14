//
//  Main Menu Scene.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SpriteKit
import SceneKit
import SwiftUI

extension GameViewController {
    
    func loadMainMenuScene() {
        currentPlayer = Player.load()
        
        print("UUID: \(currentPlayer!.uuid)\n    Current Score: \(currentPlayer!.currentScore)\n    High Score: \(currentPlayer!.highScore)\n    Total Games Played: \(currentPlayer!.timesPlayed)\n    Sum Of Scores: \(currentPlayer!.sumOfScores)\n    Average Score: \(CGFloat(currentPlayer!.sumOfScores) / CGFloat(currentPlayer!.timesPlayed))")
        
        mainMenuScene = SCNScene(named: "art.scnassets/Main Menu.scn")!
        
        let tempShip = mainMenuScene!.rootNode.childNode(withName: "ship", recursively: true)
        
        tempShip?.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 1.0)), forKey: "rotateAboutYAxis")
        
        let textNodeTop = mainMenuScene!.rootNode.childNode(withName: "titleTextTop", recursively: true)
        let textNodeBottom = mainMenuScene!.rootNode.childNode(withName: "titleTextBottom", recursively: true)
        
        let moveForwardTop = SCNAction.move(to: SCNVector3(-2.842, 3.0, -6.000), duration: 0.5)
        moveForwardTop.timingMode = .easeInEaseOut
        let moveBackwardTop = SCNAction.move(to: SCNVector3(-2.842, 3.0, -7.0), duration: 0.5)
        moveBackwardTop.timingMode = .easeInEaseOut
        textNodeTop?.runAction(SCNAction.repeatForever(SCNAction.sequence([moveForwardTop, moveBackwardTop])), forKey: "moveBackAndForthTop")
        let moveForwardBottom = SCNAction.move(to: SCNVector3(-1.21, 2.0, -6.000), duration: 0.5)
        moveForwardBottom.timingMode = .easeInEaseOut
        let moveBackwardBottom = SCNAction.move(to: SCNVector3(-1.21, 2.0, -7.0), duration: 0.5)
        moveBackwardBottom.timingMode = .easeInEaseOut
        textNodeBottom?.runAction(SCNAction.repeatForever(SCNAction.sequence([moveForwardBottom, moveBackwardBottom])), forKey: "moveBackAndForthBottom")
        
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
        
        // Create GUI
        let AppGUI = GUI(currentPlayerUI: currentPlayer!)
        // Overlay GUI
        let uiController = UIHostingController(rootView: AppGUI)
        addChild(uiController)
        uiController.view.frame = view.frame
        uiController.view.backgroundColor = UIColor.clear
        view.addSubview(uiController.view)
    }
    
    func displayMainMenuScene() {
        scnView!.present(
          mainMenuScene!,
          with: SKTransition.crossFade(withDuration: 0.1),
          incomingPointOfView: nil,
          completionHandler: nil
        )
        DispatchQueue.main.async {
            currentPlayer!.currentSceneInt = Scene.MainMenu
        }
    }
}
