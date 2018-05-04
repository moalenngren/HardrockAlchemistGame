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
    
    var backgroundMusic: SKAudioNode!
    var titleSize : CGFloat!
    var backgroundDrone: SKAudioNode!
    var alchemistCircle = SKSpriteNode(imageNamed: "Circle")
    var man = SKSpriteNode(imageNamed: "OnlyAlchemist_1")
    var table = SKSpriteNode(imageNamed: "Table")
    var scroll = SKSpriteNode(imageNamed: "Scroll")
    var scrollContainer = SKSpriteNode()
    var leftItemPosition : CGPoint!
    var rightItemPosition : CGPoint!
    let popUp = SKSpriteNode(imageNamed: "PopUpWindow")
    var popUpItem : SKSpriteNode!
    var popUpIsShowing = false
    var animationIsShowing = false
    var allVisibleItems : [Element] = []
    var allVisibleItemSprites : [SKSpriteNode] = []
    var allTitles : [SKLabelNode] = []
    var movingElement : Element!
    var itemSize : CGFloat!
    var leftElement = ""
    var leftElementSprite : SKSpriteNode!
    var rightElement = ""
    var rightElementSprite : SKSpriteNode!
    var popUpTitle = SKLabelNode(fontNamed: "PerryGothic") //PerryGothic
    var popUpInfo = SKLabelNode(fontNamed: "PerryGothic")
    let arrowLeft = SKSpriteNode(imageNamed: "ArrowLeft")
    let arrowRight = SKSpriteNode(imageNamed: "ArrowRight")
    var currentPage = 0
    var coinAmount = SKLabelNode(fontNamed: "BlackCastleMF")
    var coinSprite = SKSpriteNode(imageNamed: "Coin")
    var evaluating = false
    var notMoved = true
    var startPoint : CGPoint?
    
    enum Cases {
        case InventThis, AlreadyInvented, Nope
    }
    
    override func didMove(to view: SKView) {
        loadInventoryFromDefaults()
        /*
        for name in UIFont.familyNames {
            print(name)
        } */
        
        alchemistCircle.size = self.frame.size
        man.size = self.frame.size
        table.size = self.frame.size
        
        if (UIScreen.main.bounds.height / UIScreen.main.bounds.width) < 1.7{
            titleSize = 12
            print("Running on iPad")
            print("measures: \(UIScreen.main.bounds.height / UIScreen.main.bounds.width)")
            
            alchemistCircle.position = CGPoint(x: 0, y: 0)
        //    alchemistCircle.zPosition = 0
        //    alchemistCircle.size = self.frame.size
            alchemistCircle.yScale = 0.75
            alchemistCircle.xScale = 0.75
        //    addChild(alchemistCircle)
            
            table.position = CGPoint(x: 0, y: 0)
           // table.zPosition = 1
           // table.size = self.frame.size
            table.yScale = 0.75
         //   addChild(table)
            
            man.position = CGPoint(x: 0, y: 0)
         //   man.zPosition = 2
         //   man.size = self.frame.size
            man.yScale = 0.75
            man.xScale = 0.75
          //  addChild(man)
            
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.75
            scroll.xScale = 0.75
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height )-20)
            scroll.zPosition = 3
          //  addChild(scroll)
            
            itemSize = CGFloat(scroll.size.width / 8.8)
            
        } else if (UIScreen.main.bounds.height / UIScreen.main.bounds.width) > 1.8 {
            print("Running on iPhone X") //Screen bounds 2.16533333333333
            titleSize = 14
            
            alchemistCircle.position = CGPoint(x: 0, y: -58)
            alchemistCircle.yScale = 0.85
            alchemistCircle.xScale = 0.85
            
            table.position = CGPoint(x: 0, y: 0 - 50)
            
            man.position = CGPoint(x: 0, y: 0 - 58)
            man.yScale = 0.85
            man.xScale = 0.85
            
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.75
            scroll.xScale = 0.75
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height ) - 120)
            scroll.zPosition = 3
            
            itemSize = CGFloat(scroll.size.width / 9)
            
        } else {
            print("Running on iPhone 5-8")
            titleSize = 17
            
            alchemistCircle.position = CGPoint(x: 0, y: 0 - 50)
         //   alchemistCircle.zPosition = 0
         //   alchemistCircle.size = self.frame.size
            alchemistCircle.yScale = 0.9
            alchemistCircle.xScale = 0.9
         //   addChild(alchemistCircle)
            
            table.position = CGPoint(x: 0, y: 0 - 50)
         //   table.zPosition = 1
          //  table.size = self.frame.size
          //  addChild(table)
            
            man.position = CGPoint(x: 0, y: 0 - 58) //58?
          //  man.zPosition = 2
          //  man.size = self.frame.size
            man.yScale = 0.9
            man.xScale = 0.9
          //  addChild(man)
            
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.93
            scroll.xScale = 0.93
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height / 2) + 10)
            scroll.zPosition = 3
         //   addChild(scroll)
            
            itemSize = CGFloat(scroll.size.width / 8.8)
            
        }
        
      //  alchemistCircle.position = CGPoint(x: 0, y: 0 - 50)
        alchemistCircle.zPosition = 0
       // alchemistCircle.size = self.frame.size
      //  alchemistCircle.yScale = 0.9
     //   alchemistCircle.xScale = 0.9
        addChild(alchemistCircle)
        
        table.zPosition = 1 //
      //  table.size = self.frame.size //
        addChild(table) //
        
        man.zPosition = 2 //
      //  man.size = self.frame.size //
        addChild(man) //
        
        addChild(scroll) //
    
        leftItemPosition = CGPoint(x: 0 - 230, y: 220) // (x: 0 - 200, y: 200)
        rightItemPosition = CGPoint(x: 240, y: 210) // (x: 240, y: 150)
        
        scrollContainer.size.height = scroll.size.height - 15
        scrollContainer.size.width = scroll.size.width - 15
        scrollContainer.position = CGPoint(x: scroll.position.x + 10, y : scroll.position.y - 10)
        scrollContainer.zPosition = 4
        addChild(scrollContainer)
        
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
        
        coinSprite.size.height = itemSize / 1.5
        coinSprite.size.width = itemSize / 1.5
        coinSprite.position = CGPoint(x: frame.size.width / 2 - coinSprite.size.width / 2 - 20, y: frame.size.height / 2 - coinSprite.size.height / 2 - 20)
        coinSprite.zPosition = 0
        addChild(coinSprite)
        
     
        
        coinAmount.text = "\(discoveredItems.count)/\(allItems.count)"
        coinAmount.fontColor = SKColor.brown
        coinAmount.fontSize = titleSize * 2.2
        coinAmount.position = CGPoint(x: coinSprite.position.x - coinSprite.size.width - coinSprite.size.width / 2, y: coinSprite.position.y - coinSprite.size.height / 3)
        coinAmount.zPosition = 0
        addChild(coinAmount)
        
        
        if let musicURL = Bundle.main.url(forResource: "BackgroundMusicPlaceholder", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
        
        if let musicURL = Bundle.main.url(forResource: "CellarDrone", withExtension: "mp3") {
            backgroundDrone = SKAudioNode(url: musicURL)
            addChild(backgroundDrone)
        }
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
                
                var flavourText = ""
                
                for x in allItems { //Make this better
                    if x["discovery"]! == item {
                        flavourText = x["info"]!
                        print("flavour text is \(flavourText)")
                    }
                }
                
                //Change SOMEINFORMATION here, get it from the dictionary who has the ["discovery"] = name
                let element = Element(sprite: elementSprite, name: item, info: flavourText, index: Int(sorted.index(of: item)!), chosen: false, loc: elementSprite.position)
                elementSprite.zPosition = 5
                addChild(elementSprite)
                allVisibleItemSprites.append(elementSprite)
                allVisibleItems.append(element) //Or check in touches began and moved if they can handle sprites instead of Elements, för då slipper man göra let element oh bara kollar if item in ngn spritearray
                
                let title = SKLabelNode(fontNamed: "PerryGothic") //PerryGothic
                title.text = "\(item)"
                title.fontColor = SKColor.black
                title.fontSize = titleSize
                title.horizontalAlignmentMode = .center
                title.position = CGPoint(x: elementSprite.position.x, y: elementSprite.position.y - itemSize * 0.8 )
                title.zPosition = 4
                addChild(title)
                allTitles.append(title)
            }
        }
        setArrows(page: page)
    }
    
    func setItemPosition(nr : Int, sprite : SKSpriteNode) {
        
        // Y Pos
        if (0...4).contains(nr) {
            sprite.position.y = scrollContainer.position.y + (scrollContainer.size.height / 8) * 3
        } else if (5...9).contains(nr) {
            sprite.position.y = scrollContainer.position.y + (scrollContainer.size.height / 8) + 7
        } else if (10...14).contains(nr) {
            sprite.position.y = scrollContainer.position.y - (scrollContainer.size.height / 8) + 14
        } else if (15...19).contains(nr) {
            sprite.position.y = scrollContainer.position.y - (scrollContainer.size.height / 8) * 3 + 21
        }
        
        //X Pos
        if nr == 0 || nr == 5 || nr == 10 || nr == 15 {
            sprite.position.x = scrollContainer.position.x - (scrollContainer.size.width / 12) * 4
        } else if nr == 1 || nr == 6 || nr == 11 || nr == 16  {
            sprite.position.x = scrollContainer.position.x - (scrollContainer.size.width / 12) * 2
        } else if nr == 2 || nr == 7 || nr == 12 || nr == 17 {
            sprite.position.x = scrollContainer.position.x
        } else if nr == 3 || nr == 8 || nr == 13 || nr == 18 {
            sprite.position.x = scrollContainer.position.x + (scrollContainer.size.width / 12) * 2
        } else if nr == 4 || nr == 9 || nr == 14 || nr == 19 {
            sprite.position.x = scrollContainer.position.x + (scrollContainer.size.width / 12) * 4
        }
    }
    
    func indexContainsNr(nr : Int, index : Int) -> Bool { //Delete this method?
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
        for touch in touches {
            let location = touch.location(in: self)
            //Check several fingers????!!?
            
            if popUpIsShowing {
                popUpItem.removeFromParent()
                popUp.removeFromParent()
                popUpIsShowing = false
                popUpTitle.removeFromParent()
                popUpInfo.removeFromParent()
                
                reloadPage(currentPage)
                print("reloads inventory")
                
            } else if !animationIsShowing {
                for item in allVisibleItems {
                    if withinDistance(pos1: item.loc, pos2: location, distance: 60) {
                        
                        if movingElement != nil {
                            movingElement.sprite?.removeFromParent()
                        }
                        
                        let sprite = SKSpriteNode(imageNamed: item.name)
                        sprite.size.height = itemSize * 2
                        sprite.size.width = itemSize * 2
                        print("Clicking image: \(String(describing: item.name))!)")
                        sprite.position = location
                        sprite.zPosition = 6
                        self.addChild(sprite)
                        movingElement = Element(sprite: sprite, name: item.name, info: item.info, index: item.index, chosen: true, loc: location)
                        print("Adding \(movingElement.name) as moving element")
                        startPoint = location
                        break
                    }
                }
                
                if withinDistance(pos1: location, pos2: leftItemPosition, distance: 60) && leftElementSprite != nil { //Delete left item
                    print("Clicked element1")
                    playSound("Pop.mp3")
                    leftElementSprite?.removeFromParent()
                    leftElement = ""
                    movingElement = nil //??
                } else if withinDistance(pos1: location, pos2: rightItemPosition, distance: 60) && rightElementSprite != nil { //Delete right item
                    playSound("Pop.mp3")
                    print("Clicked element2")
                    rightElementSprite?.removeFromParent()
                    rightElement = ""
                    movingElement = nil //??
                } else if withinDistance(pos1: location, pos2: arrowLeft.position, distance: 40) && !arrowLeft.isHidden { //Left arrow
                    currentPage = currentPage - 1 //Make this code and the code for arrow right to be a func with parameter - 1 or + 1
                    reloadPage(currentPage)
                    playSound("PageTurn")
                } else if withinDistance(pos1: location, pos2: arrowRight.position, distance: 40) && !arrowRight.isHidden { //Right arrow
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
            
            if movingElement != nil {
                movingElement.sprite?.position = location
                
                if !withinDistance(pos1: location, pos2: startPoint!, distance: 10) {
                    print("Moved outside item")
                    notMoved = false
                } else {
                    notMoved = true
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !animationIsShowing {
            if movingElement != nil {
                if withinDistance(pos1: movingElement.sprite!.position, pos2: leftItemPosition, distance: 170) { //snaps to left hand
                    playSound("Snap.mp3")
                    playSnapAnimation(pos: CGPoint(x: 0 - 200, y: 200), zPos: 1)
                    
                    movingElement.sprite!.position = CGPoint(x: 0 - 200, y: 200)
                    movingElement.sprite!.zPosition = 1
                    
                    leftElementSprite?.removeFromParent()
                    leftElementSprite = SKSpriteNode(imageNamed: movingElement.name)
                    leftElementSprite.position = leftItemPosition
                    leftElementSprite.zPosition = 1
                    leftElementSprite.size.height = itemSize * 1.6
                    leftElementSprite.size.width = itemSize * 1.6
                    self.addChild(leftElementSprite)
                    leftElement = movingElement.name
                    removeMovingElement()
                    
                } else if withinDistance(pos1: movingElement.sprite!.position, pos2: rightItemPosition, distance: 170) { //snaps to right hand
                    playSound("Snap.mp3")
                    playSnapAnimation(pos: CGPoint(x: 240, y: 150), zPos: 3)
                    movingElement.sprite!.position = CGPoint(x: 240, y: 150)
                    movingElement.sprite!.zPosition = 4
                    
                    rightElementSprite?.removeFromParent()
                    rightElementSprite = SKSpriteNode(imageNamed: movingElement.name)
                    rightElementSprite.position = rightItemPosition
                    rightElementSprite.zPosition = 4
                    rightElementSprite.size.height = itemSize * 1.6
                    rightElementSprite.size.width = itemSize * 1.6
                    self.addChild(rightElementSprite)
                    rightElement = movingElement.name
                    removeMovingElement()
                    
                    print("Right element is \(String(describing: rightElementSprite.texture))")
                    print("Right element name is \(rightElement)")
                    
                } else if notMoved {
                    makePopUpView(title: movingElement.name, info: movingElement.info)
                    removeMovingElement()
                } else {
                    removeMovingElement()
                }
            }
            // Checks if both hands are full
            if leftElement != "" && rightElement != "" { // && !evaluating
                checkForNewElement(leftElement, rightElement)
            }
        } else {
            removeMovingElement()
        }
    }
    
    func removeMovingElement() {
        movingElement.sprite?.removeFromParent()
        movingElement = nil
        notMoved = true
    }
    
    func checkForNewElement(_ left : String, _ right : String) {
        evaluating = true
        print("Evaluating is true")
        print("Checking if to make new item or not")
        var makeNewItem = Cases.Nope
        var index = 0
        var thisDiscovery = ""
        var information = ""
        for x in allItems {
            if left == x["element1"] && right == x["element2"] || left == x["element2"] && right == x["element1"] {
                thisDiscovery = x["discovery"]!
                if let info = x["info"] {
                    information = info
                } else {
                    information = ""
                }
                makeNewItem = Cases.InventThis
                if discoveredItems.contains(thisDiscovery) {
                    makeNewItem = Cases.AlreadyInvented
                }
            }
        }
        if makeNewItem == .InventThis {
            playDiscoveryAnimation()
            playSound("NewDiscovery")
            let success = "Success\(arc4random_uniform(16)+1).mp3" // Randomizes between the 17 success sound files
            playSound(success)
            discoveredItems.append(thisDiscovery)
            saveInventoryToUserDefaults(inventoryItems: discoveredItems)
            coinAmount.text = "\(discoveredItems.count)/\(allItems.count)"
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(2)) //Make all waits to a function which takes a time and a block
            run(waitAction, completion: {
                self.makePopUpView(title: thisDiscovery, info: information)

            })
            
            print("Congrats! You invented \(thisDiscovery.lowercased())")
            print("Adding \(thisDiscovery) to inventory")
            index = index + 1
            
        } else if makeNewItem == .AlreadyInvented {
            print("You've already invented \(thisDiscovery) before")
            showError()
        } else if makeNewItem == .Nope {
            print("Nope, these two elements aren't doing anything")
            showError()
        }
        
    }
    
    var theView : UIView! //THIS
    
    func makePopUpView(title : String, info : String) {
        self.removeItemsFromHands()
        self.popUp.position = CGPoint(x: 0, y: 0)
        self.popUp.yScale = 0.8
        self.popUp.xScale = 0.8
        self.popUp.zPosition = 7
        self.popUpIsShowing = true
        self.addChild(self.popUp)
        
        self.popUpItem = SKSpriteNode(imageNamed: title)
        self.popUpItem.position = CGPoint(x: 0, y: 0)
        self.popUpItem.yScale = 0.3
        self.popUpItem.xScale = 0.3
        self.popUpItem.zPosition = 8
        self.addChild(self.popUpItem)
        
        self.popUpTitle.text = "\(title)"
        self.popUpTitle.fontColor = SKColor.black
        self.popUpTitle.fontSize = 60
        self.popUpTitle.horizontalAlignmentMode = .center
        self.popUpTitle.position = CGPoint(x: 0, y: self.popUp.size.height / 2 - 250)
        self.popUpTitle.zPosition = 8
        self.addChild(self.popUpTitle)
        
      //  let tv = UITextView(frame: CGRect(x: popUp.position.x, y: popUp.position.y, width: popUpItem.size.width, height: popUp.size.height / 2 - popUpItem.size.height / 2 - 50))
        
        let tv = UITextView(frame: CGRect(x: theView.frame.width / 2 + popUp.position.x - popUp.size.width / 2,
                                          y: theView.frame.height / 2 + popUp.position.y - popUp.size.height / 2,
                                          width: popUp.size.width / 2, height: popUp.size.height / 2))
        tv.isEditable = false
        
        tv.text = "\(info)"
        tv.font = UIFont(name: "PerryGothic", size: itemSize / 5)
        theView.addSubview(tv)
        tv.backgroundColor = UIColor.clear
        tv.backgroundColor = UIColor.white
        tv.textColor = UIColor.brown
        
        print("text is \(tv.text) and info is: \(info)")
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.4
        /*
        let attrString = NSMutableAttributedString(string: info)
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attrString.length))
        tv.attributedText = attrString */
        tv.textAlignment = NSTextAlignment.center
        
        self.popUpInfo.text = "\(info)"
        self.popUpInfo.fontColor = SKColor.black
        self.popUpInfo.horizontalAlignmentMode = .center
        self.popUpInfo.position = CGPoint(x: 0, y: 0 - self.popUp.size.height / 2 + 150)
        //How to make every line centered?????
        self.popUpInfo.numberOfLines = 5
        self.popUpInfo.preferredMaxLayoutWidth = scroll.size.width - 200
        self.popUpInfo.fontSize = 30 // 12
     //   self.popUpInfo.xScale = 2 //
     //   self.popUpInfo.yScale = 2 //
      
        self.popUpInfo.zPosition = 8
        self.addChild(self.popUpInfo)
        
        self.evaluating = false
        print("Evaluating is false")
    }
    
    func showError() {
        let error = "Error\(arc4random_uniform(14)).mp3"
        playSound(error)
        if !evaluating { //FIX THIS
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        } //Take this condition away
        let waitAction = SKAction.wait(forDuration: TimeInterval(1))
        run(waitAction, completion: {
            self.removeItemsFromHands() //REMOVE ONLY THE MOST RECENT ONE
        })
        
    }
    
    func removeItemsFromHands() {
        leftElementSprite?.removeFromParent()
        leftElement = ""
        //movingElement = nil //??
        rightElementSprite?.removeFromParent()
        rightElement = ""
        evaluating = false
        print("Evaluating is false")
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
                discovery.removeFromParent() //Don't remove?
                self.evaluating = false
                print("Evaluating is false")
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
            print("Evaluating is true")
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
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func withinDistance(pos1: CGPoint, pos2: CGPoint, distance: Float) -> Bool {
        let dx = pos1.x - pos2.x
        let dy = pos1.y - pos2.y
        let hypotenusa = Float(sqrt(dx * dx + dy * dy))
        return hypotenusa < distance
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
