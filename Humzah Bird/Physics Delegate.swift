//
//  Physics Delegate.swift
//  Humzah Bird
//
//  Created by Yanni Speron on 4/25/20.
//  Copyright © 2020 Yanni Speron. All rights reserved.
//

import Foundation
import SceneKit

extension GameViewController: SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        if (contact.nodeA === ship! || contact.nodeB === ship!) {
            events.append(BirdDeathEvent())
        }
    }
}
