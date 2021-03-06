//
//  Ground.swift
//  Flying Penguin
//
//  Created by Jackie Thind on 3/9/17.
//  Copyright © 2017 Patola Games. All rights reserved.
//

import SpriteKit

// Add a new class, inheriting from SKSpriteNode and
// adhering to the GameSprite protocol.
class Ground: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Environment")
    // We will not use initialsize for ground, but we still need
    // to declare it to conform to our GameSprite protocol:
    var initialSize = CGSize.zero
    
    // This function tiles the ground texture across the width
    // of the ground node. We will call it from our GameScene 
    func createChildren() {
        // this is one of those unique situations where we use a
        // non-default anchor point. By positiong the ground by 
        // its top left corner, we can place it just slightly 
        // above the botom of the screen, on any of screen size
        self.anchorPoint = CGPoint (x: 0, y: 1)
        
        // First load the ground texture from the atlas:
        let texture = textureAtlas.textureNamed("ground")
        
        var tileCount:CGFloat = 0
        // we will size the tiles in their point size 
        // they are 35 points wide and 300 points tall 
        let tileSize = CGSize(width:35, height:300)
        
        // Build nodes until we cover the entire Ground width 
        while tileCount * tileSize.width < self.size.width {
            let tileNode = SKSpriteNode(texture:texture)
            tileNode.size = tileSize
            tileNode.position.x = tileCount * tileSize.width
            // Position child nodes by their upper left corner
            tileNode.anchorPoint = CGPoint(x:0, y:1)
            // Add the child texture to the ground node:
            self.addChild(tileNode)
            
            tileCount += 1
            // Draw an edge physics body along the top of the ground node
            // Note: physics body positions are relative to their nodes
            // the top left of the node is x:0, y:0, given our anchor point 
            // the top right of the node is x:size.width, y:0
            let pointTopLeft = CGPoint(x:0,y:0)
            let pointTopRight = CGPoint(x: size.width, y:0)
            self.physicsBody = SKPhysicsBody(edgeFrom: pointTopLeft, to:pointTopRight)
        }
    }
    // Implement onTap to adhere to the protocol:
    func onTap() {}
}
