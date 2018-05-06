//
//  Element.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-04-22.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import Foundation
import SpriteKit


class Element {
    let sprite: SKSpriteNode?
    var name: String
    var info: String
    var loc: CGPoint
    
    init() { //Do I need this?????
        sprite = nil
        name = ""
        info = ""
        loc = CGPoint(x: 0, y: 0)
    }
    
    init(sprite: SKSpriteNode, name: String, info: String, loc: CGPoint) {
        self.sprite = sprite
        self.name = name
        self.info = info
        self.loc = loc
    }
}










