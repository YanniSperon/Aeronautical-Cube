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
            var hasBirdDeathEvent = false
            for event in events {
                if event is BirdDeathEvent {
                    hasBirdDeathEvent = true
                }
            }
            if (!hasBirdDeathEvent) {
                events.append(BirdDeathEvent())
            }
        }
    }
}
