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
    var index: Int
    var chosen: Bool
    var loc: CGPoint
    
    init() {
        sprite = nil
        name = ""
        index = 0
        chosen = false
        loc = CGPoint(x: 0, y: 0)
    }
    
    init(sprite: SKSpriteNode, name: String, index: Int, chosen: Bool, loc: CGPoint) {
        self.sprite = sprite
        self.name = name
        self.index = index
        self.chosen = chosen
        self.loc = loc
    }
}










