//
//  GameSprite.swift
//  Flying Penguin
//
//  Created by Jackie Thind on 3/8/17.
//  Copyright © 2017 Patola Games. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas: SKTextureAtlas {get set}
    var initialSize: CGSize { get set }
    func onTap()
}
