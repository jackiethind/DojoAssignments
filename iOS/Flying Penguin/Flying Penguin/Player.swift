//
//  Player.swift
//  Flying Penguin
//
//  Created by Jackie Thind on 3/9/17.
//  Copyright © 2017 Patola Games. All rights reserved.
//

import SpriteKit

class Player : SKSpriteNode, GameSprite {
    var initialSize = CGSize(width: 64, height: 64)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Pierre")
    // Pierre has multiple animations. Right now we will
    // create one animation for flying up 
    // and one for going down:
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    // Store whether we are flapping our wings or in free-fall
    var flapping = false
    // set a maximum upward force
    // 57,000 ft feels good to me, adjust to taste
    let maxFlappingForce:CGFloat = 57000
    // Pierre should slow down when he flies too high 
    let maxHeight:CGFloat = 1000
    
    init() {
        // call the init function on the 
        // base class (SKSpriteNode)
        super.init(texture: nil, color: .clear, size: initialSize)
        
        createAnimations()
            // if we run an action with a key, "flapAnimation"
            // we can later reference that
            // key to remove the action
        self.run(soarAnimation ,withKey: "soarAnimation")
        // Create a physics body based on one frame of Pierre's animation.
        // We wil use the third frame, when his wings are tucked in 
        let bodyTexture = textureAtlas.textureNamed("pierre-flying-3")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: self.size)
        // Pierre will lose momentum quickly with a high linearDamping:
        self.physicsBody?.linearDamping = 0.9
        // Adults pengiuns weigh around 30kg:
        self.physicsBody?.mass = 30
        // prevent pierre from rotating
        self.physicsBody?.allowsRotation = false
        
    }
       
    func createAnimations() {
            let rotateUpAction = SKAction.rotate(byAngle: 0, duration: 0.475)
            rotateUpAction.timingMode = .easeOut
            let rotateDownAction = SKAction.rotate(byAngle: -1, duration: 0.8)
            rotateDownAction.timingMode = .easeIn
            let flyFrames: [SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1"),
            textureAtlas.textureNamed("pierre-flying-2"),
            textureAtlas.textureNamed("pierre-flying-3"),
            textureAtlas.textureNamed("pierre-flying-4"),
            textureAtlas.textureNamed("pierre-flying-3"),
            textureAtlas.textureNamed("pierre-flying-2")
            ]
            let flyAction = SKAction.animate(with:flyFrames, timePerFrame:0.03)
            // Group together the flying animation with rotation:
            flyAnimation = SKAction.group([SKAction.repeatForever(flyAction), rotateUpAction])
        
            // Create the soaring animation,
            // just one frame for now:
            let soarFrames:[SKTexture] = [textureAtlas.textureNamed("pierre-flying-1")]
            let soarAction = SKAction.animate(with: soarFrames, timePerFrame:1)
            // Group the soaring animation with the rotation down: 
            soarAnimation = SKAction.group([SKAction.repeatForever(soarAction), rotateDownAction])
            
    }
    
    // Implement onTap to conform to the GameSprite protocol:
    func onTap() {
        
    }
    // Satisy the NSCoder required init:
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    func update () {
        // if flapping, apply a new force to push pierre higher
        if self.flapping {
            var forceToApply = maxFlappingForce
            
            // apply less force if pierre is above position 600
            if position.y > 600 {
                // the higher pierre goes, the more force we 
                // remove. these next three lines determine the 
                // force to subtract
                let percentageOfMaxHeight = position.y / maxHeight
                let flappingForceSubtraction = percentageOfMaxHeight * maxFlappingForce
                forceToApply -= flappingForceSubtraction
            }
            // apply the final force 
            self.physicsBody?.applyForce(CGVector(dx:0, dy:forceToApply))
        }
        // limit pierre's top speed as he climbs the y-axis 
        // this prevents him from gaining enough momentum to shoot voer our max height.
        // we bend the physics for game play
        if self.physicsBody!.velocity.dy > 300 {
            self.physicsBody!.velocity.dy = 300
        }
    }
    
    // Begin the flap animation, set flapping to true:
    func startFlapping() {
        self.removeAction(forKey: "soarAnimation")
        self.run(flyAnimation, withKey: "flapAnimation")
        self.flapping = true
    }
    
    // Stop the flapping animation, set flapping to false:
    func stopFlapping() {
        self.removeAction(forKey: "flapAnimation")
        self.run(soarAnimation, withKey: "soarAnimation")
        self.flapping = false
    }
}
