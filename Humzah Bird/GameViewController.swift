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

class GameViewController: UIViewController {

    var gameScene: SCNScene?
    var behindCameraNode: SCNNode?
    var leftCameraNode: SCNNode?
    var rightCameraNode: SCNNode?
    var lightNode: SCNNode?
    var ship: SCNNode?
    var scnView: SCNView?
    var mainMenuScene: SCNScene?
    var events: [Event] = []
    var topObstacles: [SCNNode?] = []
    var bottomObstacles: [SCNNode?] = []
    var currentPOV: POVType = POVType.Behind
    // frame refers to the walls, ceiling, and floor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameViewController = self
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
        if (currentPlayer!.currentSceneInt == Scene.Game) {
            ship!.physicsBody?.velocity = SCNVector3(0.0, 10.0, 0.0)
        }
    }
    
    @objc
    func handleRightSwipe(_ gestureRecognize: UIGestureRecognizer) {
        // TODO Add cool animation
        //ship!.runAction(SCNAction.rotateBy(x: 0, y: 0, z: 2.0 * CGFloat.pi, duration: 1.0))
        if (currentPlayer!.currentSceneInt == Scene.Game) {
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
        if (currentPlayer!.currentSceneInt == Scene.Game) {
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
        print("Current Score: \(currentPlayer!.currentScore)")
        print("----------------------")
        print("High Score: \(currentPlayer!.highScore)")
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
