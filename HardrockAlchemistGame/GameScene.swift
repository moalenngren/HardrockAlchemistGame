//
//  GameScene.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-04-18.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import SpriteKit
import GameplayKit
import AudioToolbox

class GameScene: SKScene {
    
    var alchemistCircle = SKSpriteNode(imageNamed: "Circle")
    var man = SKSpriteNode(imageNamed: "OnlyAlchemist_1")
    var table = SKSpriteNode(imageNamed: "Table")
    var scroll = SKSpriteNode(imageNamed: "Scroll")
    let scrollContainer = SKSpriteNode(imageNamed: "transparent")
    var itemImage1 = SKSpriteNode(imageNamed: "GlassBall")
    var itemImage2 = SKSpriteNode(imageNamed: "GlassBall")
    let popUp = SKSpriteNode(imageNamed: "PopUpWindow")
    var popUpItem : SKSpriteNode!
    var popUpIsShowing = false
    var animationIsShowing = false
    var discoveredItems = ["Earth", "Air", "Fire", "Water", "Rain", "Mud", "Cloud", "Stone", "Sand", "Time", "Glass", "Pressure", "Wind", "Energy", "Lake", "Sea", "Wave", "Electricity", "Lightning"] //Reset to standard after testing
    var allVisibleItems : [Element] = []
    var allVisibleItemSprites : [SKSpriteNode] = []
    var allTitles : [SKLabelNode] = []
    var movingItem : SKSpriteNode!
    var movingElement : Element!
    var itemSize : CGFloat!
    var leftElement = ""
    var leftElementSprite : SKSpriteNode!
    var rightElement = ""
    var rightElementSprite : SKSpriteNode!
    var popUpText = SKLabelNode(fontNamed: "PerryGothic")
    let arrowLeft = SKSpriteNode(imageNamed: "ArrowLeft")
    let arrowRight = SKSpriteNode(imageNamed: "ArrowRight")
    var currentPage = 0
    
    enum Cases {
        case InventThis, AlreadyInvented, Nope
    }
    
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
        addChild(itemImage1)
        
        itemImage2.size.height = self.frame.size.height / 8
        itemImage2.size.width = itemImage1.size.height
        itemImage2.position = CGPoint(x: 240, y: 150)
        itemImage2.zPosition = 3
        addChild(itemImage2)
        
        itemSize = CGFloat(scroll.size.width / 8.6)
        
        scrollContainer.size.height = scroll.size.height - 15
        scrollContainer.size.width = scroll.size.width - 15
        scrollContainer.position = CGPoint(x: scroll.position.x + 10, y : scroll.position.y - 10)
        scrollContainer.zPosition = 4
        addChild(scrollContainer) //Do I have to fill this with a sprite??
        
        arrowLeft.size.height = itemSize * 0.8
        arrowLeft.size.width = itemSize * 0.8
        arrowLeft.position = CGPoint(x: 0 - scroll.size.width / 2 + 20, y: scroll.position.y - scroll.size.height / 2 + arrowLeft.size.height / 2 + 10)
        arrowLeft.zPosition = 7
        addChild(arrowLeft)
        arrowRight.size.height = itemSize * 0.8
        arrowRight.size.width = itemSize * 0.8
        arrowRight.position = CGPoint(x: scroll.size.width / 2 - 20, y: scroll.position.y - scroll.size.height / 2 + arrowRight.size.height / 2 + 10)
        arrowRight.zPosition = 7
        addChild(arrowRight)
   
        reloadPage(0)
    }
    
    func reloadPage(_ page : Int) {
        
        for item in allVisibleItemSprites {
            item.removeFromParent()
        }
        for title in allTitles {
            title.removeFromParent()
        }
        allVisibleItems.removeAll()
 
        var sorted : [String]
        sorted = discoveredItems.sorted(by: <)
        let lowerBounds = page * 20
        let higherBounds = page * 20 + 20
        for index in lowerBounds..<higherBounds {

            if index < sorted.count {
                let item = sorted[index]
                let elementSprite = SKSpriteNode(imageNamed: item)
                elementSprite.size.width = itemSize
                elementSprite.size.height = itemSize
                
                let nr = index - 20 * page //Evaluate directly in the line below??
                setItemPosition(nr : nr, sprite : elementSprite)
                
                print("Position of scrollContainer is \(scrollContainer.position)")
                print("Nr is \(nr)")
                
                let element = Element(sprite: elementSprite, name: item, index: Int(sorted.index(of: item)!), chosen: false, loc: elementSprite.position)
                elementSprite.zPosition = 5
                addChild(elementSprite)
                allVisibleItemSprites.append(elementSprite)
                allVisibleItems.append(element) //Or check in touches began and moved if they can handle sprites instead of Elements, för då slipper man göra let element oh bara kollar if item in ngn spritearray
                
                let title = SKLabelNode(fontNamed: "Perrygothic")
                title.text = "\(item)"
                title.fontColor = SKColor.black
                title.fontSize = 18
                title.horizontalAlignmentMode = .center
                title.position = CGPoint(x: elementSprite.position.x, y: elementSprite.position.y - itemSize * 0.75 )
                title.zPosition = 4
                addChild(title)
                allTitles.append(title)
                print("Adding \(item) to inventory")
            }
        }
        setArrows(page: page)
    }
    
    func setItemPosition(nr : Int, sprite : SKSpriteNode) {
        
        print("Setting position")
        
        // Y Pos
        if (0...4).contains(nr) {
            sprite.position.y = scrollContainer.position.y + (scrollContainer.size.height / 8) * 3
        } else if (5...9).contains(nr) {
            sprite.position.y = scrollContainer.position.y + (scrollContainer.size.height / 8) + 4
        } else if (10...14).contains(nr) {
            sprite.position.y = scrollContainer.position.y - (scrollContainer.size.height / 8) + 4
        } else if (15...19).contains(nr) {
            sprite.position.y = scrollContainer.position.y - (scrollContainer.size.height / 8) * 3 + 4
        }
        
        //X Pos
        if nr == 0 || nr == 5 || nr == 10 || nr == 15 {
            sprite.position.x = scrollContainer.position.x - (scrollContainer.size.width / 12) * 4
        } else if nr == 1 || nr == 6 || nr == 11 || nr == 16  {
            sprite.position.x = scrollContainer.position.x - (scrollContainer.size.width / 12) * 2
        } else if nr == 2 || nr == 7 || nr == 12 || nr == 17 {
            sprite.position.x = scrollContainer.position.x // - (scrollContainer.size.width / 12) * 0
        } else if nr == 3 || nr == 8 || nr == 13 || nr == 18 {
            sprite.position.x = scrollContainer.position.x + (scrollContainer.size.width / 12) * 2
        } else if nr == 4 || nr == 9 || nr == 14 || nr == 19 {
            sprite.position.x = scrollContainer.position.x + (scrollContainer.size.width / 12) * 4
        }
    }
    
    func indexContainsNr(nr : Int, index : Int) -> Bool {
        var i = index
        var n = 0
        let nrToLookFor = nr
        var isIn = false
        
        while (i > 0) {
            n = i % 10
            i = i / 10
            if (n == nrToLookFor) {
                isIn = true
            }
        }
        print ("Numret finns = \(isIn)")
        return isIn
    }
    
    func setArrows(page : Int) {
        if page == 0 {
            arrowLeft.isHidden = true
        } else {
            arrowLeft.isHidden = false
        }
        if discoveredItems.count < page * 20 + 21 {
            arrowRight.isHidden = true
        } else {
            arrowRight.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Try to separate long press and short press!!!! Short = present info square
        for touch in touches {
            let location = touch.location(in: self)
            //Check several fingers????!!?
            
            if popUpIsShowing {
                popUpItem.removeFromParent()
                popUp.removeFromParent()
                popUpIsShowing = false
                popUpText.removeFromParent()
                
                reloadPage(currentPage)
                print("reloads inventory")
                
            } else if !animationIsShowing {
                for item in allVisibleItems {
                    if withinDistance(itemPos: item.loc, handPos: location, distance: 60) {
                        movingItem = SKSpriteNode(imageNamed: item.name)
                        movingItem.size.height = itemSize
                        movingItem.size.width = itemSize
                        print("Clicking image: \(String(describing: item.name))!)")
                        movingItem.position = location
                        movingItem.zPosition = 6
                        self.addChild(movingItem)
                        movingElement = Element(sprite: movingItem, name: item.name, index: item.index, chosen: true, loc: location)
                        print("Adding \(movingElement.name) as moving element")
                    }
                }
                
                if withinDistance(itemPos: location, handPos: CGPoint(x: 0 - 200, y: 200), distance: 60) { //Delete element1
                    print("Clicked element1")
                    playSound("Snap2.wav") //Change to Pop
                    leftElementSprite?.removeFromParent()
                    leftElement = ""
                    movingElement = nil //??
                } else if withinDistance(itemPos: location, handPos: CGPoint(x: 240, y: 150), distance: 60) { //Delete element2
                    playSound("Snap2.wav") //Change to Pop
                    print("Clicked element2")
                    rightElementSprite?.removeFromParent()
                    rightElement = ""
                    movingElement = nil //??
                } else if withinDistance(itemPos: location, handPos: arrowLeft.position, distance: 40) && !arrowLeft.isHidden { //Left arrow
                    currentPage = currentPage - 1 //Make this code and the code for arrow right to be a func with parameter - 1 or + 1
                    reloadPage(currentPage)
                    playSound("PageTurn")
                } else if withinDistance(itemPos: location, handPos: arrowRight.position, distance: 40) && !arrowRight.isHidden { //Right arrow
                    currentPage = currentPage + 1
                    playSound("PageTurn")
                    reloadPage(currentPage)
                    
                }
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
                playSound("Snap.mp3")
                playSnapAnimation(pos: CGPoint(x: 0 - 200, y: 200), zPos: 1)

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
                
                print("Left element is \(String(describing: leftElementSprite.texture))")
                print("Left element name is \(leftElement)")
                
            } else if withinDistance(itemPos: movingItem.position, handPos: CGPoint(x: 240, y: 150), distance: 150) { //snaps to right hand
                print("Ended touches at right hand")
                playSound("Snap.mp3")
                playSnapAnimation(pos: CGPoint(x: 240, y: 150), zPos: 3)
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
                
                print("Right element is \(String(describing: rightElementSprite.texture))")
                print("Right element name is \(rightElement)")
                
            } else {
                //Deleting the moving object
                movingItem.removeFromParent()
                movingElement = nil
            }
        }
        // Checks if both hands are full
        if leftElement != "" && rightElement != "" {
            checkForNewElement(leftElement, rightElement)
        }
    }
    
    func checkForNewElement(_ left : String, _ right : String) {
        print("Checking if to make new item or not")
        var makeNewItem = Cases.Nope
        var index = 0
        var thisDiscovery = ""
        for x in allItems {
            if left == x["element1"] && right == x["element2"] || left == x["element2"] && right == x["element1"] {
                thisDiscovery = x["discovery"]! //Plockar fram vilket item som ska skapas
                makeNewItem = Cases.InventThis //Säger åt programmet att göra ett nytt item
                if discoveredItems.contains(thisDiscovery) {
                    makeNewItem = Cases.AlreadyInvented //Säger åt programmet att detta redan är uppfunnet
                }
            }
        }
        if makeNewItem == .InventThis {
            playDiscoveryAnimation()
            playSound("NewDiscovery")
            playSound("EvilLaugh")
            discoveredItems.append(thisDiscovery)
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(2)) //Make all waits to a function which takes a time and a block
            run(waitAction, completion: {
                
                self.removeItemsFromHands()
                self.popUp.position = CGPoint(x: 0, y: 0)
                self.popUp.yScale = 0.8
                self.popUp.xScale = 0.8
                self.popUp.zPosition = 7
                self.popUpIsShowing = true
                self.addChild(self.popUp)
                self.popUpItem = SKSpriteNode(imageNamed: thisDiscovery)
                self.popUpItem.position = CGPoint(x: 0, y: 0)
                self.popUpItem.yScale = 0.3
                self.popUpItem.xScale = 0.3
                self.popUpItem.zPosition = 8
                self.addChild(self.popUpItem)
                self.popUpText.text = "\(thisDiscovery)"
                self.popUpText.fontColor = SKColor.black
                self.popUpText.fontSize = 60
                self.popUpText.horizontalAlignmentMode = .center
                self.popUpText.position = CGPoint(x: 0, y: self.popUp.size.height / 2 - 250)
                self.popUpText.zPosition = 8
                self.addChild(self.popUpText)
                
                //Ta reda på alla fontnamn!!!!
                /*
                for name in UIFont.familyNames {
                    print(name)
                } */
                
                
            })
            
            print("Congrats! You invented \(thisDiscovery.lowercased())")
            print("adding \(thisDiscovery) to inventory")
            index = index + 1
            
            
        } else if makeNewItem == .AlreadyInvented {
            print("You've already invented \(thisDiscovery) before")
            playSound("Error")
            //Shaking animation
        } else if makeNewItem == .Nope {
            print("Nope, these two elements aren't doing anything")
            //Shaking animation
            playSound("Error")
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
        let waitAction = SKAction.wait(forDuration: TimeInterval(1))
        run(waitAction, completion: {
            self.removeItemsFromHands()
        })
    }
    
    func removeItemsFromHands() {
        leftElementSprite?.removeFromParent()
        leftElement = ""
        movingElement = nil //??
        rightElementSprite?.removeFromParent()
        rightElement = ""
    }
    
    func playDiscoveryAnimation() {
        playSnapAnimation(pos: leftElementSprite.position, zPos: 1)
        playSnapAnimation(pos: rightElementSprite.position, zPos: 3)
        animationIsShowing = true
        if let discovery = SKEmitterNode(fileNamed: "DiscoveryParticles") {
            addChild(discovery)
            discovery.position = CGPoint(x: -20, y: -40)
            discovery.advanceSimulationTime(10)
            discovery.zPosition = 5
            discovery.particleLifetime = 0.3
            // discovery.particleBirthRate = 0
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(2))
            discovery.run(waitAction, completion: {
                discovery.removeFromParent()
            })
        }
        
        if let fire = SKEmitterNode(fileNamed: "DiscoveryFire") {
            addChild(fire)
            fire.position = CGPoint(x: -20, y: -40)
            fire.advanceSimulationTime(10)
            fire.zPosition = 6
            fire.particleLifetime = 2
            // discovery.particleBirthRate = 0
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(fire.particleLifetime))
            fire.run(waitAction, completion: {
                fire.removeFromParent()
                self.animationIsShowing = false
            })
        }
    }
    
    func playSnapAnimation(pos: CGPoint, zPos: CGFloat) {
        if let snapAnimation = SKEmitterNode(fileNamed: "SnapAnimation") {
            addChild(snapAnimation)
            snapAnimation.position = pos
            snapAnimation.advanceSimulationTime(10)
            snapAnimation.zPosition = zPos
            snapAnimation.particleLifetime = 3
            snapAnimation.particleBirthRate = 0
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(snapAnimation.particleLifetime))
            snapAnimation.run(waitAction, completion: {
                snapAnimation.removeFromParent()
            })
        }
    }
    
    func playSound(_ name: String) {
        let sound = SKAction.playSoundFileNamed(name, waitForCompletion: false)
        // sound.run(SKAction.changeVolume(to: Float(3), duration: 0))
        run(sound)
        //  run(SKAction.playSoundFileNamed(name, waitForCompletion: false))
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
