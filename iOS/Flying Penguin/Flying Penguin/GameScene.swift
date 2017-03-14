//
//  GameScene.swift
//  Flying Penguin
//
//  Created by Jackie Thind on 3/8/17.
//  Copyright © 2017 Patola Games. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    // Create a constant cam as a SKCameraNode
    let cam = SKCameraNode()
    let motionManager = CMMotionManager()
    let ground = Ground()
    // Create our bee node as a property of GameScene so we can 
    // assess it throughout the class
    // (make sure to remove the old bee declaration below)
    let player = Player()
    
    override func didMove(to view: SKView) {
        // Make the scene position from its lower left 
        // corner, regardless of any other settings:
        self.anchorPoint = .zero
        
        // Set the scene's background to a nice sky blue 
        // Note: UIColor uses a scale from 0 to 1 for its colors
        self.backgroundColor = UIColor(red:0.4, green:0.6, blue:0.95, alpha:1.0)
        // Assign the camera to the scene
        self.camera = cam
        
        let bee2 = Bee()
        bee2.position = CGPoint(x:325, y:325)
        self.addChild(bee2)
        let bee3 = Bee()
        bee3.position = CGPoint(x:200, y:325)
        self.addChild(bee3)
        
        // Call the new bee function
        // Position the ground based on the screen size 
        // Position X: Negative one screen width 
        // Position Y: 150 abouve the botton (remember the top left anchor point)
        ground.position = CGPoint(x:-self.size.width*2, y:30)
        // Set the ground width to 3x the width of the scene 
        // the height can be 0, our child nnodes will create the height
        ground.size = CGSize(width: self.size.width * 6, height:0)
        // Run the ground's createChildren function to build
        // the child texture tiles 
        ground.createChildren()
        // Add the ground node to the scene:
        self.addChild(ground)
        // Position the player:
        player.position = CGPoint(x:150, y:250)
        // Add the player node to the scene:
        self.addChild(player)
        self.motionManager.startAccelerometerUpdates()
        self.physicsWorld.gravity = CGVector(dx:0,dy:-5)

    }
    
    // A new function 
    override func didSimulatePhysics() {
        // Keep the camera centered on the bee 
        // Notice the ! operator after the camera. SKScene's camera
        // is an optional, but we know it is there since we 
        // assigned it above in the didMove function. We can tell 
        // Swift that we know it can unwrap this value by using 
        // the ! operator after the property name
        self.camera!.position = player.position
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            // find the location of the touch:
            let location = touch.location(in:self)
            // locate the node at this location
            let nodeTouched = atPoint(location)
            // attempt to downcast the node to the gamesprite protocol 
            if let gameSprite = nodeTouched as? GameSprite {
                // if this node adheres to GameSprite, call onTap:
                gameSprite.onTap()
            }
        }
        player.startFlapping()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.update()
        // Unwrap the accelerometer data optional:
    if let accelData = self.motionManager.accelerometerData {
        var forceAmount:CGFloat
        var movement = CGVector()
        
        // Based on the device orientation, the tilt number 
        // can indicate opposite user desires. The
        // UIApplication class exposes an enum that allows 
        // us to pull the current orientation 
        // we will use this opportunity to explore swifts
        // switch syntax and assing the corrent force for the 
        // current orientation 
        switch
            UIApplication.shared.statusBarOrientation {
        case .landscapeLeft:
            // the 20,000 number is an amount that felt right 
            // for our example, given Pierres 30kg mass:
            forceAmount = 20000
        case .landscapeRight:
            forceAmount = -20000
        default:
            forceAmount = 0
        }
        // If the device is tilted more than 15% towards 
        // vertical, then we want to move the pengiun:
        if accelData.acceleration.y > 0.15 {
            movement.dx = forceAmount
        }
        // Core motion values are relative to portrait view 
        // since we are in landscape, use y-values for x axis
        else if accelData.acceleration.y < -0.15 {
            movement.dx = -forceAmount
        }
        // apply the force we created to the player
        player.physicsBody?.applyForce(movement)
    }
    }
}
