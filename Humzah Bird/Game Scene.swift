//
//  Game Scene.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

extension GameViewController {
    
    func loadGameScene() {
        gameScene = SCNScene(named: "art.scnassets/Game.scn")
        
        ship = gameScene?.rootNode.childNode(withName: "ship", recursively: true)
        
        behindCameraNode = gameScene?.rootNode.childNode(withName: "behindCamera", recursively: true)
        leftCameraNode = gameScene?.rootNode.childNode(withName: "leftCamera", recursively: true)
        rightCameraNode = gameScene?.rootNode.childNode(withName: "rightCamera", recursively: true)
        
        let tempScene = SCNScene(named: "art.scnassets/Obstacle2.scn")
        
        let tempTopObstacle1 = tempScene?.rootNode.childNode(withName: "topObstacle1", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle1!)
        topObstacles.append(tempTopObstacle1)
        let tempBottomObstacle1 = tempScene?.rootNode.childNode(withName: "bottomObstacle1", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle1!)
        bottomObstacles.append(tempBottomObstacle1)
        
        let tempTopObstacle2 = tempScene?.rootNode.childNode(withName: "topObstacle2", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle2!)
        topObstacles.append(tempTopObstacle2)
        let tempBottomObstacle2 = tempScene?.rootNode.childNode(withName: "bottomObstacle2", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle2!)
        bottomObstacles.append(tempBottomObstacle2)
        
        let tempTopObstacle3 = tempScene?.rootNode.childNode(withName: "topObstacle3", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle3!)
        topObstacles.append(tempTopObstacle3)
        let tempBottomObstacle3 = tempScene?.rootNode.childNode(withName: "bottomObstacle3", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle3!)
        bottomObstacles.append(tempBottomObstacle3)
        
        let tempTopObstacle4 = tempScene?.rootNode.childNode(withName: "topObstacle4", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle4!)
        topObstacles.append(tempTopObstacle4)
        let tempBottomObstacle4 = tempScene?.rootNode.childNode(withName: "bottomObstacle4", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle4!)
        bottomObstacles.append(tempBottomObstacle4)
        
        let tempTopObstacle5 = tempScene?.rootNode.childNode(withName: "topObstacle5", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle5!)
        topObstacles.append(tempTopObstacle5)
        let tempBottomObstacle5 = tempScene?.rootNode.childNode(withName: "bottomObstacle5", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle5!)
        bottomObstacles.append(tempBottomObstacle5)
        
        let tempTopObstacle6 = tempScene?.rootNode.childNode(withName: "topObstacle6", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle6!)
        topObstacles.append(tempTopObstacle6)
        let tempBottomObstacle6 = tempScene?.rootNode.childNode(withName: "bottomObstacle6", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle6!)
        bottomObstacles.append(tempBottomObstacle6)
        
        let tempTopObstacle7 = tempScene?.rootNode.childNode(withName: "topObstacle7", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle7!)
        topObstacles.append(tempTopObstacle7)
        let tempBottomObstacle7 = tempScene?.rootNode.childNode(withName: "bottomObstacle7", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle7!)
        bottomObstacles.append(tempBottomObstacle7)
        
        let tempTopObstacle8 = tempScene?.rootNode.childNode(withName: "topObstacle8", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle8!)
        topObstacles.append(tempTopObstacle8)
        let tempBottomObstacle8 = tempScene?.rootNode.childNode(withName: "bottomObstacle8", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle8!)
        bottomObstacles.append(tempBottomObstacle8)
        
        let tempTopObstacle9 = tempScene?.rootNode.childNode(withName: "topObstacle9", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle9!)
        topObstacles.append(tempTopObstacle9)
        let tempBottomObstacle9 = tempScene?.rootNode.childNode(withName: "bottomObstacle9", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle9!)
        bottomObstacles.append(tempBottomObstacle9)
        
        let tempTopObstacle10 = tempScene?.rootNode.childNode(withName: "topObstacle10", recursively: true)
        gameScene?.rootNode.addChildNode(tempTopObstacle10!)
        topObstacles.append(tempTopObstacle10)
        let tempBottomObstacle10 = tempScene?.rootNode.childNode(withName: "bottomObstacle10", recursively: true)
        gameScene?.rootNode.addChildNode(tempBottomObstacle10!)
        bottomObstacles.append(tempBottomObstacle10)
        
        
        
        // INIT OVERLAY GUI: overlayGUI
        
        overlayGUI = SKScene(size: scnView!.bounds.size)
        //overlayGUI?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scoreTextNode = SKLabelNode()
        scoreTextNode!.attributedText = NSAttributedString(string: "Score: 0", attributes: [.font: UIFont.systemFont(ofSize: 36.0), .foregroundColor: UIColor.white])
        scoreTextNode!.position = CGPoint(x: scnView!.bounds.standardized.maxX * 3 / 4, y: scnView!.bounds.standardized.maxY * 7 / 8)
        overlayGUI?.addChild(scoreTextNode!)
        
        /*topObstacle = tempScene?.rootNode.childNode(withName: "topObstacle", recursively: true)
        topObstacle?.name = "topObstacle"
        bottomObstacle = tempScene?.rootNode.childNode(withName: "bottomObstacle", recursively: true)
        bottomObstacle?.name = "bottomObstacle"*/
        
        /*let tempObstacleTop = self.topObstacle?.copy()
        self.gameScene?.rootNode.addChildNode(tempObstacleTop as! SCNNode)
        let tempObstacleBottom = self.bottomObstacle?.copy()
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom as! SCNNode)
        */
        
        /*let tempObstacleTop1 = self.topObstacle?.copy() as? SCNNode
        tempObstacleTop1?.presentation.position = SCNVector3(0.0, 20.0, 10.0)
        self.gameScene?.rootNode.addChildNode(tempObstacleTop1!)
        let tempObstacleBottom1 = self.bottomObstacle?.copy() as? SCNNode
        tempObstacleBottom1?.presentation.position = SCNVector3(0.0, 5.0, 10.0)
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom1!)
        
        let tempObstacleTop2 = self.topObstacle?.copy() as? SCNNode
        tempObstacleTop2?.presentation.position = SCNVector3(0.0, 20.0, 15.0)
        self.gameScene?.rootNode.addChildNode(tempObstacleTop2!)
        let tempObstacleBottom2 = self.bottomObstacle?.copy() as? SCNNode
        tempObstacleBottom2?.presentation.position = SCNVector3(0.0, 20.0, 15.0)
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom2!)
        
        let tempObstacleTop3 = self.topObstacle?.copy() as? SCNNode
        tempObstacleTop3?.position.z += 15.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop3!)
        let tempObstacleBottom3 = self.bottomObstacle?.copy() as? SCNNode
        tempObstacleBottom3?.position.z += 15.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom3!)
        
        let tempObstacleTop4 = self.topObstacle?.copy() as? SCNNode
        tempObstacleTop4?.position.z += 20.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop4!)
        let tempObstacleBottom4 = self.bottomObstacle?.copy() as? SCNNode
        tempObstacleBottom3?.position.z += 20.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom4!)
        
        let tempObstacleTop5 = self.topObstacle?.copy() as? SCNNode
        tempObstacleTop5?.position.z += 25.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop5!)
        let tempObstacleBottom5 = self.bottomObstacle?.copy() as? SCNNode
        tempObstacleBottom5?.position.z += 25.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom5!)*/
        
        // create a new scene
        /*gameScene = SCNScene(named: "art.scnassets/Game.scn")!
        // create and add a camera to the scene
        cameraNode = SCNNode()
        cameraNode!.camera = SCNCamera()
        gameScene!.rootNode.addChildNode(cameraNode!)
        
        // place the camera
        cameraNode!.position = SCNVector3(x: 0, y: 10, z: -20)
        
        // create and add a light to the scene
        lightNode = SCNNode()
        lightNode!.light = SCNLight()
        lightNode!.light!.type = .omni
        lightNode!.position = cameraNode!.position
        gameScene!.rootNode.addChildNode(lightNode!)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        gameScene!.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the ship node
        let shipGeo = SCNBox()
        shipGeo.firstMaterial?.diffuse.contents = UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        ship = SCNNode(geometry: shipGeo)
        //ship = gameScene!.rootNode.childNode(withName: "ship", recursively: true)!
        ship!.position = SCNVector3(0.0, 2.0, 0.0)
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        physicsBody.mass = 2.0
        physicsBody.restitution = 0.0
        physicsBody.angularVelocityFactor = SCNVector3(0.0, 0.0, 0.0)
        physicsBody.isAffectedByGravity = true
        physicsBody.angularDamping = 1.0
        physicsBody.contactTestBitMask = 5
        physicsBody.categoryBitMask = shipBitMask
        physicsBody.collisionBitMask = frameBitMask | obstacleBitMask
        ship!.physicsBody = physicsBody
        gameScene!.rootNode.addChildNode(ship!)
        
        let geo = SCNFloor()
        geo.firstMaterial?.diffuse.contents = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        floor = SCNNode(geometry: geo)
        floor!.position = SCNVector3(0.0, -5.0, 0.0)
        floor!.scale = SCNVector3(15.0, 1.0, 15.0)
        let floorPhysBody = SCNPhysicsBody(type: .static, shape: nil)
        floorPhysBody.contactTestBitMask = 5
        floorPhysBody.categoryBitMask = frameBitMask
        floorPhysBody.collisionBitMask = shipBitMask
        floor!.physicsBody = floorPhysBody
        gameScene!.rootNode.addChildNode(floor!)
        
        let wallgeo = SCNBox()
        wallgeo.firstMaterial?.diffuse.contents = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let wall = SCNNode(geometry: wallgeo)
        wall.position = SCNVector3(5.0, 0.0, 0.0)
        wall.scale = SCNVector3(0.5, 50.0, 50.0)
        wall.eulerAngles.y = GLKMathDegreesToRadians(-90)
        spawnObstacle()
        
        /*let tempGeo = SCNBox()
        tempGeo.firstMaterial?.diffuse.contents = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        let tempBox = SCNNode(geometry: tempGeo)
        tempBox.position = SCNVector3(0.0, 10.0, 0.0)
        tempBox.scale = SCNVector3(1.0, 1.0, 1.0)
        let tempBoxPhysicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        tempBoxPhysicsBody.contactTestBitMask = 5
        tempBox.physicsBody = tempBoxPhysicsBody
        gameScene!.rootNode.addChildNode(tempBox)*/
        
        // animate the 3d object
        //ship!.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0, z: 1, duration: 0.1)))
        cameraNode!.look(at: ship!.position)
        let cameraConstraints: [SCNConstraint] = [SCNLookAtConstraint(target: ship!)]
        cameraNode!.constraints = cameraConstraints
 */
        //gameScene?.physicsWorld.gravity = SCNVector3(0.0, -98.0665, 0.0)
        gameScene?.physicsWorld.contactDelegate = self
    }
    
    func displayGameScene() {
        resetGameScene()
        scnView!.present(
          gameScene!,
          with: SKTransition.crossFade(withDuration: 0.1),
          incomingPointOfView: nil,
          completionHandler: nil
        )
        ship!.physicsBody?.applyForce(SCNVector3(0.0, 10.0, 0.0), asImpulse: true)
        //ship!.physicsBody!.applyForce(SCNVector3(0.0, 50.0, 0.0), asImpulse: true)
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
        scnView!.audioListener = ship
        scnView!.overlaySKScene = overlayGUI
    }
    
    func resetGameScene() {
        gameScene!.rootNode.enumerateChildNodes { (node, stop) in
            if (!(node.name == "rightCamera" || node.name == "leftCamera" || node.name == "behindCamera" || node.name == "omni" || node.name == "ambient")) {
                node.removeFromParentNode()
            }
        }
        let tempScene = SCNScene(named: "art.scnassets/Game.scn")
        
        tempScene!.rootNode.enumerateChildNodes { (node, stop) in
            if (!(node.name == "rightCamera" || node.name == "leftCamera" || node.name == "behindCamera" || node.name == "omni" || node.name == "ambient")) {
                gameScene!.rootNode.addChildNode(node)
            }
        }
        
        //let tempObstacleTop = self.topObstacle?.copy()
        //self.gameScene?.rootNode.addChildNode(tempObstacleTop as! SCNNode)
        //let tempObstacleBottom = self.bottomObstacle?.copy()
        //self.gameScene?.rootNode.addChildNode(tempObstacleBottom as! SCNNode)
        let tempObstacleTop1 = self.topObstacles[0]!.copy() as! SCNNode
        let random1 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop1.position.y = 65.0 + random1
        tempObstacleTop1.position.z = 10.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop1)
        let tempObstacleBottom1 = self.bottomObstacles[0]!.copy() as! SCNNode
        tempObstacleBottom1.position.y = -40.0 + random1
        tempObstacleTop1.position.z = 10.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom1)
        
        let tempObstacleTop2 = self.topObstacles[1]!.copy() as! SCNNode
        let random2 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop2.position.y = 65.0 + random2
        tempObstacleTop2.position.z = 15.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop2)
        let tempObstacleBottom2 = self.bottomObstacles[1]!.copy() as! SCNNode
        tempObstacleBottom2.position.y = -40.0 + random2
        tempObstacleBottom2.position.z = 15.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom2)
        
        let tempObstacleTop3 = self.topObstacles[2]!.copy() as! SCNNode
        let random3 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop3.position.y = 65.0 + random3
        tempObstacleTop3.position.z = 20.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop3)
        let tempObstacleBottom3 = self.bottomObstacles[2]!.copy() as! SCNNode
        tempObstacleBottom3.position.y = -40.0 + random3
        tempObstacleBottom3.position.z = 20.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom3)
        
        let tempObstacleTop4 = self.topObstacles[3]!.copy() as! SCNNode
        let random4 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop4.position.y = 65.0 + random4
        tempObstacleTop4.position.z = 25.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop4)
        let tempObstacleBottom4 = self.bottomObstacles[3]!.copy() as! SCNNode
        tempObstacleBottom4.position.y = -40.0 + random4
        tempObstacleBottom4.position.z = 25.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom4)
        
        let tempObstacleTop5 = self.topObstacles[4]!.copy() as! SCNNode
        let random5 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop5.position.y = 65.0 + random5
        tempObstacleTop5.position.z = 30.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop5)
        let tempObstacleBottom5 = self.bottomObstacles[4]!.copy() as! SCNNode
        tempObstacleBottom5.position.y = -40.0 + random5
        tempObstacleBottom5.position.z = 30.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom5)
        
        let tempObstacleTop6 = self.topObstacles[5]!.copy() as! SCNNode
        let random6 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop6.position.y = 65.0 + random6
        tempObstacleTop6.position.z = 35.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop6)
        let tempObstacleBottom6 = self.bottomObstacles[5]!.copy() as! SCNNode
        tempObstacleBottom6.position.y = -40.0 + random6
        tempObstacleBottom6.position.z = 35.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom6)
        
        let tempObstacleTop7 = self.topObstacles[6]!.copy() as! SCNNode
        let random7 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop7.position.y = 65.0 + random7
        tempObstacleTop7.position.z = 40.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop7)
        let tempObstacleBottom7 = self.bottomObstacles[6]!.copy() as! SCNNode
        tempObstacleBottom7.position.y = -40.0 + random7
        tempObstacleBottom7.position.z = 40.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom7)
        
        let tempObstacleTop8 = self.topObstacles[7]!.copy() as! SCNNode
        let random8 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop8.position.y = 65.0 + random8
        tempObstacleTop8.position.z = 45.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop8)
        let tempObstacleBottom8 = self.bottomObstacles[7]!.copy() as! SCNNode
        tempObstacleBottom8.position.y = -40.0 + random8
        tempObstacleBottom8.position.z = 45.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom8)
        
        let tempObstacleTop9 = self.topObstacles[8]!.copy() as! SCNNode
        let random9 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop9.position.y = 65.0 + random9
        tempObstacleTop9.position.z = 50.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop9)
        let tempObstacleBottom9 = self.bottomObstacles[8]!.copy() as! SCNNode
        tempObstacleBottom9.position.y = -40.0 + random9
        tempObstacleBottom9.position.z = 50.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom9)
        
        let tempObstacleTop10 = self.topObstacles[9]!.copy() as! SCNNode
        let random10 = Float.random(in: minYIncrement...maxYIncrement)
        tempObstacleTop10.position.y = 65.0 + random10
        tempObstacleTop10.position.z = 55.0
        self.gameScene?.rootNode.addChildNode(tempObstacleTop10)
        let tempObstacleBottom10 = self.bottomObstacles[9]!.copy() as! SCNNode
        tempObstacleBottom10.position.y = -40.0 + random10
        tempObstacleBottom10.position.z = 55.0
        self.gameScene?.rootNode.addChildNode(tempObstacleBottom10)
        	
        ship = gameScene?.rootNode.childNode(withName: "ship", recursively: true)
        
        
        
        behindCameraNode = gameScene?.rootNode.childNode(withName: "behindCamera", recursively: true)
        behindCameraNode?.constraints?.removeAll()
        let cameraConstraints: [SCNConstraint] = [SCNLookAtConstraint(target: ship!)]
        behindCameraNode!.constraints = cameraConstraints
        
        
        leftCameraNode = gameScene?.rootNode.childNode(withName: "leftCamera", recursively: true)
        leftCameraNode?.constraints?.removeAll()
        leftCameraNode!.constraints = cameraConstraints
        
        
        rightCameraNode = gameScene?.rootNode.childNode(withName: "rightCamera", recursively: true)
        rightCameraNode?.constraints?.removeAll()
        rightCameraNode!.constraints = cameraConstraints
        
        /*floor!.position = SCNVector3(0.0, -5.0, 0.0)
        floor!.scale = SCNVector3(15.0, 1.0, 15.0)
        ship!.position = SCNVector3(0.0, 0.0, 0.0)
        ship!.physicsBody?.angularVelocity = SCNVector4(0.0, 0.0, 0.0, 0.0)
        ship!.physicsBody?.velocity = SCNVector3(0.0, 0.0, 0.0)
        for obstacle in obstacles {
            obstacle.removeFromParentNode()
        }
        spawnObstacle()*/
        events.removeAll()
    }
}
