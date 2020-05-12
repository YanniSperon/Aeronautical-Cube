//
//  GameViewController.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/24/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

class GameViewController: UIViewController {

    var currentScene: SceneTypes = SceneTypes.MainMenu
    var gameScene: SCNScene?
    var behindCameraNode: SCNNode?
    var leftCameraNode: SCNNode?
    var rightCameraNode: SCNNode?
    var mainMenuHighScoreTextNode: SCNNode?
    var lightNode: SCNNode?
    var ship: SCNNode?
    var scnView: SCNView?
    var mainMenuScene: SCNScene?
    var overlayGUI: SKScene?
    var scoreTextNode: SKLabelNode?
    var events: [Event] = []
    var topObstacles: [SCNNode?] = []
    var bottomObstacles: [SCNNode?] = []
    var currentPOV: POVType = POVType.Behind
    // frame refers to the walls, ceiling, and floor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainMenuScene()
        loadGameScene()
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        scnView!.addGestureRecognizer(tapGesture)
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe(_:)))
        rightSwipeGesture.direction = .right
        scnView!.addGestureRecognizer(rightSwipeGesture)
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe(_:)))
        leftSwipeGesture.direction = .left
        scnView!.addGestureRecognizer(leftSwipeGesture)
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDownSwipe(_:)))
        downSwipeGesture.direction = .down
        scnView!.addGestureRecognizer(downSwipeGesture)
    }
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        if (currentScene == .MainMenu) {
            currentScene = .Game
            displayGameScene()
        } else if (currentScene == .Game) {
            //ship!.physicsBody?.applyForce(SCNVector3(0.0, 10.0, 0.0), asImpulse: true)
            ship!.physicsBody?.velocity = SCNVector3(0.0, 7.0, 0.0)
            //ship!.physicsBody!.applyForce(SCNVector3(0.0, 105.0, 0.0), asImpulse: true)
            // retrieve the SCNView
            /*let scnView = self.view as! SCNView
            
            // check what nodes are tapped
            let p = gestureRecognize.location(in: scnView)
            let hitResults = scnView.hitTest(p, options: [:])
            // check that we clicked on at least one object
            if hitResults.count > 0 {
                // retrieved the first clicked object
                let result = hitResults[0]
                
                // get its material
                let material = result.node.geometry!.firstMaterial!
                
                // highlight it
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                
                // on completion - unhighlight
                SCNTransaction.completionBlock = {
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.5
                    
                    material.emission.contents = UIColor.black
                    
                    SCNTransaction.commit()
                }
                
                material.emission.contents = UIColor.red
                
                SCNTransaction.commit()
            }*/
        }
    }
    
    @objc
    func handleRightSwipe(_ gestureRecognize: UIGestureRecognizer) {
        // TODO Add cool animation
        //ship!.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 2.0 * CGFloat.pi, duration: 1.0))
        if (currentScene == .Game) {
            if (currentPOV == .Behind) {
                scnView?.pointOfView = rightCameraNode
                currentPOV = .Right
            } else if (currentPOV == .Left) {
                scnView?.pointOfView = behindCameraNode
                currentPOV = .Behind
            }
        }
    }
    
    @objc
    func handleLeftSwipe(_ gestureRecognize: UIGestureRecognizer) {
        // TODO Add cool animation
        //ship!.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 2.0 * CGFloat.pi, duration: 1.0))
        if (currentScene == .Game) {
            if (currentPOV == .Behind) {
                scnView?.pointOfView = leftCameraNode
                currentPOV = .Left
            } else if (currentPOV == .Right) {
                scnView?.pointOfView = behindCameraNode
                currentPOV = .Behind
            }
        }
    }
    
    @objc
    func handleDownSwipe(_ gestureRecognize: UIGestureRecognizer) {
        // TODO Add cool animation
        //ship!.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 2.0 * CGFloat.pi, duration: 1.0))
        print("----------------------")
        print("Current Score: \(currentScore)")
        print("----------------------")
        print("High Score: \(highScore)")
        print("----------------------")
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
