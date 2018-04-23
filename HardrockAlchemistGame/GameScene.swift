//
//  GameScene.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-04-18.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var alchemistCircle = SKSpriteNode(imageNamed: "Circle")
    var man = SKSpriteNode(imageNamed: "OnlyAlchemist_1")
    var table = SKSpriteNode(imageNamed: "Table")
    var scroll = SKSpriteNode(imageNamed: "Scroll")
    var itemImage1 = SKSpriteNode(imageNamed: "GlassBall")
    var itemImage2 = SKSpriteNode(imageNamed: "GlassBall")
    /*var discoveredItems : [Element] = [Element(sprite: SKSpriteNode(imageNamed: "Air"), name: "Air", index: 0, chosen: false),
                                       Element(sprite: SKSpriteNode(imageNamed: "Earth"), name: "Earth", index: 1, chosen: false),
                                       Element(sprite: SKSpriteNode(imageNamed: "Water"), name: "Water", index: 2, chosen: false),
                                        Element(sprite: SKSpriteNode(imageNamed: "Fire"), name: "Fire", index: 3, chosen: false)] */
    
    var discoveredItems = ["Earth", "Air", "Fire", "Water"]
    var allVisibleItems : [Element] = []
   /* var allVisibleItems = [SKSpriteNode(imageNamed: "Earth"), SKSpriteNode(imageNamed: "Water"), SKSpriteNode(imageNamed: "Fire"), SKSpriteNode(imageNamed: "Air"), SKSpriteNode(imageNamed: "Wind")] */
    var movingItem : SKSpriteNode!
    var movingElement : Element!
    var itemSize : CGFloat!
    //var leftElement : SKNode?
    var leftElement = ""
    var leftElementSprite : SKSpriteNode!
    //var rightElement : SKNode?
    var rightElement = ""
    var rightElementSprite : SKSpriteNode!

    
    override func didMove(to view: SKView) {
        
        if (UIScreen.main.bounds.height / UIScreen.main.bounds.width) <= (alchemistCircle.size.height / alchemistCircle.size.width){
            //(frame.size.height / frame.size.width)  <= (alchemistCircle.size.height / alchemistCircle.size.width)
            print ("if: nuvarande device är bredare i förhållande till höjd, jämfört med bilden")
            print("Screen bounds \(UIScreen.main.bounds.height / UIScreen.main.bounds.width)")
            print("circle höjd/bredd=\(alchemistCircle.size.height / alchemistCircle.size.width)")
            alchemistCircle.position = CGPoint(x: 0, y: 0)
            alchemistCircle.zPosition = 0
            alchemistCircle.size = self.frame.size
            alchemistCircle.yScale = 0.75
            alchemistCircle.xScale = 0.75
            addChild(alchemistCircle)
            
            table.position = CGPoint(x: 0, y: 0)
            table.zPosition = 1
            table.size = self.frame.size
            table.yScale = 0.75
           // table.xScale = 0.7
            addChild(table)
            
            man.position = CGPoint(x: 0, y: 0)
            man.zPosition = 2
            man.size = self.frame.size
            man.yScale = 0.75
            man.xScale = 0.75
            addChild(man)
            
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.75
            scroll.xScale = 0.75
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height )-20)
            scroll.zPosition = 3
            addChild(scroll)
            
            
        } else {
 
      
        alchemistCircle.position = CGPoint(x: 0, y: 0 - 50)
        alchemistCircle.zPosition = 0
        alchemistCircle.size = self.frame.size
        alchemistCircle.yScale = 0.9
        alchemistCircle.xScale = 0.9
        addChild(alchemistCircle)
        
        table.position = CGPoint(x: 0, y: 0 - 50)
        table.zPosition = 1
        table.size = self.frame.size
       // table.yScale = 0
        // table.xScale = 0.7
        addChild(table)
        
        man.position = CGPoint(x: 0, y: 0 - 58)
        man.zPosition = 2
        man.size = self.frame.size
        man.yScale = 0.9
        man.xScale = 0.9
        addChild(man)
        
        scroll.size.height = self.frame.size.height / 2.5
        scroll.size.width = self.frame.size.width
        scroll.yScale = 0.9
        scroll.xScale = 0.9
        scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height / 2))
        scroll.zPosition = 3
        addChild(scroll)
        
        print("Size of frame = \(self.frame.size.width)")
        print("Size of scroll = \(scroll.size.width)")
        print("Size of screen = \(UIScreen.main.bounds.width)")
        }
        
        itemImage1.size.height = self.frame.size.height / 8
        itemImage1.size.width = itemImage1.size.height
        itemImage1.position = CGPoint(x: 0 - 200, y: 200)
        itemImage1.zPosition = 1
        //itemImage1.yScale = 0.5
       // itemImage1.xScale = 0.5
        addChild(itemImage1)
        
        itemImage2.size.height = self.frame.size.height / 8
        itemImage2.size.width = itemImage1.size.height
        itemImage2.position = CGPoint(x: 240, y: 150)
        itemImage2.zPosition = 3
        //itemImage1.yScale = 0.5
        // itemImage1.xScale = 0.5
        addChild(itemImage2)
        
        /*
        for item in allVisibleItems {
            let index = CGFloat(allVisibleItems.index(of: item)! + 1)
            let size = scroll.size.width / 6
            item.size.width = size
            item.size.height = size
            let pos = size * index + 20
            let xPos = 0 - (scroll.size.width / 2) + pos
            item.position = CGPoint(x: xPos , y: scroll.position.y + 40 )
            item.zPosition = 4
            addChild(item)
        } */
        
        itemSize = CGFloat(scroll.size.width / 6)
        
        for item in discoveredItems {
            let elementSprite = SKSpriteNode(imageNamed: item)
            let size = scroll.size.width / 6
            elementSprite.size.width = size
            elementSprite.size.height = size
            let pos = size * CGFloat(Int(discoveredItems.index(of: item)!) + 1) + 20
            let xPos = 0 - (scroll.size.width / 2) + pos
            elementSprite.position = CGPoint(x: xPos , y: scroll.position.y + 40 )
            let element = Element(sprite: elementSprite, name: item, index: Int(discoveredItems.index(of: item)!), chosen: false, loc: elementSprite.position)
            elementSprite.zPosition = 4
            addChild(elementSprite)
            allVisibleItems.append(element)
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       //Try to separate long press and short press!!!! Short = present info square
        for touch in touches {
            let location = touch.location(in: self)
            //Check several fingers????!!?
            for item in allVisibleItems {
                if withinDistance(itemPos: item.loc, handPos: location, distance: 60) {
              //  if item.contains(location) { //make contains a property on Element to use discoveredItems instead of allVisible...
                  /*
                    movingSprite = SKSpriteNode(imageNamed: item.name)
                    movingSprite.size.height = itemSize
                    movingSprite.size.width = itemSize
                    movingSprite.position = location
                    movingSprite.zPosition = 5
                    movingItem = Element(sprite: movingSprite, name: item.name, index: item.index, chosen: true, loc: location)
                    addChild(movingSprite) */
                    
                    movingItem = SKSpriteNode(imageNamed: item.name)
                    movingItem.size.height = itemSize
                    movingItem.size.width = itemSize
                    print("Clicking image: \(String(describing: item.name))!)")
                    movingItem.position = location
                    movingItem.zPosition = 5
                    self.addChild(movingItem)
                    movingElement = Element(sprite: movingItem, name: item.name, index: item.index, chosen: true, loc: location)
                    print("Adding \(movingElement.name) as moving element")
                }
            }
            
            if withinDistance(itemPos: location, handPos: CGPoint(x: 0 - 200, y: 200), distance: 60) { //Delete element1
                print("Clicked element1")
               // leftElement?.removeFromParent()
                leftElementSprite?.removeFromParent()
                leftElement = ""
                movingElement = nil //??
            } else if withinDistance(itemPos: location, handPos: CGPoint(x: 240, y: 150), distance: 60) { //Delete element1
                print("Clicked element2")
               // rightElement?.removeFromParent()
                rightElementSprite?.removeFromParent()
                rightElement = ""
                movingElement = nil //??
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
           // for item in allVisibleItems {
                if movingItem.contains(location) {
                    movingItem.position = location
                }
            
           // }
        }
       
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        if movingElement != nil {
            if withinDistance(itemPos: movingItem.position, handPos: CGPoint(x: 0 - 200, y: 200), distance: 150) { //snaps to left hand
                print("Ended touches at left hand")
                
                playSound("snap")
                //Show animation
                movingItem.position = CGPoint(x: 0 - 200, y: 200)
                movingItem.zPosition = 1
                
              //  replaceItem(hand: "left", sprite: leftElementSprite)
                leftElementSprite?.removeFromParent()
                leftElementSprite = SKSpriteNode(imageNamed: movingElement.name)
                leftElementSprite.position = CGPoint(x: 0 - 200, y: 200)
                leftElementSprite.zPosition = 1
                leftElementSprite.size.height = itemSize
                leftElementSprite.size.width = itemSize
                self.addChild(leftElementSprite)
                leftElement = movingElement.name
                movingItem.removeFromParent()
                movingElement.sprite?.removeFromParent()
                movingElement = nil
                
                print("Left element is \(leftElementSprite.texture)")
                print("Left element name is \(leftElement)")
                
            } else if withinDistance(itemPos: movingItem.position, handPos: CGPoint(x: 240, y: 150), distance: 150) { //snaps to right hand
                print("Ended touches at right hand")
                
                playSound("snap")
                //Show animation
                movingItem.position = CGPoint(x: 240, y: 150)
                movingItem.zPosition = 4
           
                rightElementSprite?.removeFromParent()
                rightElementSprite = SKSpriteNode(imageNamed: movingElement.name)
                rightElementSprite.position = CGPoint(x: 240, y: 150)
                rightElementSprite.zPosition = 4
                rightElementSprite.size.height = itemSize
                rightElementSprite.size.width = itemSize
                self.addChild(rightElementSprite)
                rightElement = movingElement.name
                movingItem.removeFromParent()
                movingElement.sprite?.removeFromParent()
                movingElement = nil
                
                print("Right element is \(rightElementSprite.texture)")
                print("Right element name is \(rightElement)")
                
            } else {
                movingItem.removeFromParent() //Deleting
                movingElement = nil
            }
        }
        // check if both hands are full????
    }
    
    func playSound(_ sound: String) {
        
    }
    
    /*
    func replaceItem(hand : String, sprite: SKSpriteNode) {
        if hand == "left" {
            leftElementSprite?.removeFromParent()
            leftElementSprite = SKSpriteNode(imageNamed: movingElement.name)
            leftElement = movingElement.name
        } else if hand == "right" {
            rightElementSprite?.removeFromParent()
            rightElementSprite = SKSpriteNode(imageNamed: movingElement.name)
            rightElement = movingElement.name
        }
        sprite.position = CGPoint(x: 0 - 200, y: 200)
        sprite.zPosition = 1
        sprite.size.height = itemSize
        sprite.size.width = itemSize
        self.addChild(sprite)
        movingItem.removeFromParent()
        movingElement.sprite?.removeFromParent()
        movingElement = nil
    } */
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    func withinDistance(itemPos: CGPoint, handPos: CGPoint, distance: Float) -> Bool { //Change name to pos1 and pos2
        let dx = itemPos.x - handPos.x
        let dy = itemPos.y - handPos.y
        let hypotenusa = Float(sqrt(dx * dx + dy * dy))
        return hypotenusa < distance
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
