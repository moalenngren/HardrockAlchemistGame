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
    var popUpTitle = SKLabelNode(fontNamed: "PerryGothic")
    var popUpInfo = SKLabelNode(fontNamed: "PerryGothic")
    let arrowLeft = SKSpriteNode(imageNamed: "ArrowLeft")
    let arrowRight = SKSpriteNode(imageNamed: "ArrowRight")
    var currentPage = 0
    var coinAmount = SKLabelNode(fontNamed: "BlackCastleMF")
    var coinSprite = SKSpriteNode(imageNamed: "Coin")
  //  var evaluating = false
    var moved = false
    var startPoint : CGPoint?
    var flavourTextSize : CGFloat!
    var tv = UITextView()
    let textViewRecognizer = UITapGestureRecognizer()
    var recentHand = ""
    
    enum Cases {
        case InventThis, AlreadyInvented, Nope
    }
    
    override func didMove(to view: SKView) {
        loadInventoryFromDefaults()
        
        alchemistCircle.size = self.frame.size
        man.size = self.frame.size
        table.size = self.frame.size
        coinSprite.position = CGPoint(x: frame.size.width / 2 - 40,
                                      y: frame.size.height / 2 - 40)
        
        if (UIScreen.main.bounds.height / UIScreen.main.bounds.width) < 1.7 { //Why are the iPad size settings not working anymore?????
            print("Running on iPad")
            print("Bounds are \(UIScreen.main.bounds.height / UIScreen.main.bounds.width)")
            titleSize = 12
            flavourTextSize = 28
            alchemistCircle.position = CGPoint(x: 0, y: 0)
            alchemistCircle.yScale = 0.75
            alchemistCircle.xScale = 0.75
            table.position = CGPoint(x: 0, y: 0)
            table.yScale = 0.75
            man.position = CGPoint(x: 0, y: 0)
            man.yScale = 0.75
            man.xScale = 0.75
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.75
            scroll.xScale = 0.75
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height )-20)
            scroll.zPosition = 3
            itemSize = CGFloat(scroll.size.width / 8.8)
            popUp.yScale = 0.8
            popUp.xScale = 0.8
            
        } else if (UIScreen.main.bounds.height / UIScreen.main.bounds.width) > 1.8 {
            print("Running on iPhone X") //Screen height / width = 2.16533333333333
            titleSize = 14
            
            alchemistCircle.position = CGPoint(x: 0, y: -58)
            alchemistCircle.yScale = 0.85
            alchemistCircle.xScale = 0.85
            table.position = CGPoint(x: 0, y: 0 - 50)
            man.position = CGPoint(x: 0, y: 0 - 60)
            man.yScale = 0.85
            man.xScale = 0.85
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.75
            scroll.xScale = 0.75
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height ) - 120)
            scroll.zPosition = 3
            itemSize = CGFloat(scroll.size.width / 9)
            flavourTextSize = itemSize / 5
            popUp.xScale = 0.75
            popUp.yScale = 0.75
            coinSprite.position = CGPoint(x: frame.size.width / 2 - 100,
                                          y: frame.size.height / 2 - 100)
            
        } else {
            print("Running on iPhone 5-8")
            print("bounds are \(UIScreen.main.bounds.height / UIScreen.main.bounds.width)") //1.77866666666667
            titleSize = 17
            alchemistCircle.position = CGPoint(x: 0, y: 0 - 50)
            alchemistCircle.yScale = 0.9
            alchemistCircle.xScale = 0.9
            table.position = CGPoint(x: 0, y: 0 - 50)
            man.position = CGPoint(x: 0, y: 0 - 58)
            man.yScale = 0.9
            man.xScale = 0.9
            scroll.size.height = self.frame.size.height / 2.5
            scroll.size.width = self.frame.size.width
            scroll.yScale = 0.93
            scroll.xScale = 0.93
            scroll.position = CGPoint(x: 0, y: (-self.frame.size.height / 2) + (scroll.size.height / 2) + 10)
            scroll.zPosition = 3
            itemSize = CGFloat(scroll.size.width / 8.8)
            flavourTextSize = itemSize / 6
            popUp.yScale = 0.8
            popUp.xScale = 0.8
        }
        
        alchemistCircle.zPosition = 0
        addChild(alchemistCircle)
        table.zPosition = 1
        addChild(table)
        man.zPosition = 2
        addChild(man)
        addChild(scroll)
    
        leftItemPosition = CGPoint(x: 0 - 230, y: 220)
        rightItemPosition = CGPoint(x: 240, y: 210)
        
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
        coinSprite.zPosition = 10
        addChild(coinSprite)
     
        coinAmount.text = "\(discoveredItems.count)/\(allItems.count)"
        coinAmount.fontColor = SKColor.brown
        coinAmount.fontSize = titleSize * 2.2
        coinAmount.position = CGPoint(x: coinSprite.position.x - coinSprite.size.width - coinSprite.size.width / 2,
                                      y: coinSprite.position.y - coinSprite.size.height / 3)
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
                
                setItemPosition(nr : index - 20 * page, sprite : elementSprite)
                
                var flavourText = ""
                
                for x in allItems { //Make this better!?
                    if x["discovery"]! == item {
                        flavourText = x["info"]!
                    }
                }
                
                let element = Element(sprite: elementSprite, name: item, info: flavourText, loc: elementSprite.position)
                elementSprite.zPosition = 5
                addChild(elementSprite)
                allVisibleItemSprites.append(elementSprite)
                allVisibleItems.append(element)
                let title = SKLabelNode(fontNamed: "PerryGothic")
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
    
    func deletePopUp() {
        popUpItem.removeFromParent()
        popUp.removeFromParent()
        popUpIsShowing = false
        popUpTitle.removeFromParent()
        popUpInfo.removeFromParent()
        tv.isHidden = true
        reloadPage(currentPage)
        print("reloads inventory")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if popUpIsShowing {
                deletePopUp()
                
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
                        movingElement = Element(sprite: sprite, name: item.name, info: item.info, loc: location)
                        print("Adding \(movingElement.name) as moving element")
                        startPoint = location
                        break
                    }
                }
                
                if withinDistance(pos1: location, pos2: leftItemPosition, distance: 60) && leftElement != "" { //Delete left item
                    playSound("Pop.mp3")
                    leftElementSprite?.removeFromParent()
                    leftElement = ""
                    movingElement = nil
                } else if withinDistance(pos1: location, pos2: rightItemPosition, distance: 60) && rightElement != "" { //Delete right item
                    playSound("Pop.mp3")
                    rightElementSprite?.removeFromParent()
                    rightElement = ""
                    movingElement = nil
                } else if withinDistance(pos1: location, pos2: arrowLeft.position, distance: 35) && !arrowLeft.isHidden { //Left arrow
                    clickedArrow(page: currentPage - 1)
                } else if withinDistance(pos1: location, pos2: arrowRight.position, distance: 35) && !arrowRight.isHidden { //Right arrow
                    clickedArrow(page: currentPage + 1)
                }
            }
        }
    }
    
    func clickedArrow(page : Int) {
        currentPage = page
        reloadPage(currentPage)
        playSound("PageTurn")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if movingElement != nil {
                movingElement.sprite?.position = location
                
                if !withinDistance(pos1: location, pos2: startPoint!, distance: 10) {
                    moved = true
                } else {
                    moved = false
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !animationIsShowing {
            if movingElement != nil {
                if withinDistance(pos1: movingElement.sprite!.position, pos2: leftItemPosition, distance: 170) { //Snaps to left hand
                    playSound("Snap.mp3")
                    playSnapAnimation(pos: leftItemPosition, zPos: 1)
                    
                    movingElement.sprite!.position = leftItemPosition
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
                    recentHand = "left"
                    
                } else if withinDistance(pos1: movingElement.sprite!.position, pos2: rightItemPosition, distance: 170) { //Snaps to right hand
                    playSound("Snap.mp3")
                    playSnapAnimation(pos: rightItemPosition, zPos: 3)
                    movingElement.sprite!.position = rightItemPosition
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
                    recentHand = "right"
                    
                } else if !moved {
                    makePopUpView(title: movingElement.name, info: movingElement.info)
                    removeMovingElement()
                } else {
                    removeMovingElement()
                }
            }

            if leftElement != "" && rightElement != "" {
                checkForNewElement(leftElement, rightElement)
            }
        } else {
            if movingElement != nil {
                removeMovingElement()
            }
        }
    }
    
    func removeMovingElement() {
        movingElement.sprite?.removeFromParent()
        movingElement = nil
        moved = false
    }
    
    func checkForNewElement(_ left : String, _ right : String) {
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
            let success = "Success\(arc4random_uniform(16)+1).mp3"
            playSound(success)
            discoveredItems.append(thisDiscovery)
            saveInventoryToUserDefaults(inventoryItems: discoveredItems)
            coinAmount.text = "\(discoveredItems.count)/\(allItems.count)"
            
            let waitAction = SKAction.wait(forDuration: TimeInterval(2))
            run(waitAction, completion: {
                self.makePopUpView(title: thisDiscovery, info: information)
            })
            
            print("Congrats! You invented \(thisDiscovery.lowercased())")
            index = index + 1
            
        } else if makeNewItem == .AlreadyInvented {
            print("You've already invented \(thisDiscovery) before")
            showError()
        } else if makeNewItem == .Nope {
            print("Nope, these two elements aren't doing anything")
            showError()
        }
    }
    
    var theView : UIView!
    
    func makePopUpView(title : String, info : String) {
        self.removeItemsFromHands()
        self.popUp.position = CGPoint(x: 0, y: 0)
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
        
        tv = UITextView(frame: CGRect(x: 0, y: 0, width: theView.frame.width / 1.5, height: popUp.size.height / 9))
        tv.center = CGPoint(x: theView.frame.width / 2, y: theView.frame.height / 1.3 )
        tv.isEditable = false
        tv.text = "\(info)"
        tv.backgroundColor = UIColor.clear
        tv.textColor = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        let attrString = NSMutableAttributedString(string: info)
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attrString.length))
        tv.attributedText = attrString
        tv.textAlignment = NSTextAlignment.center
        tv.font = UIFont(name: "PerryGothic", size: flavourTextSize)
        theView.addSubview(tv)
        textViewRecognizer.addTarget(self, action: #selector(tappedTextView(_:)))
        tv.addGestureRecognizer(textViewRecognizer)
    }
    
    @objc func tappedTextView(_ sender: UITapGestureRecognizer) {
        if !tv.isHidden {
            print("Tapped flavour text!")
            deletePopUp()
        }
    }
    
    func showError() {
        let error = "Error\(arc4random_uniform(14)).mp3"
        playSound(error)
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let waitAction = SKAction.wait(forDuration: TimeInterval(1))
        run(waitAction, completion: {
            self.removeItemsFromHands()
        })
    }
    
    func removeItemsFromHands() {
        if recentHand == "left" {
            leftElementSprite?.removeFromParent()
            leftElement = ""
        } else if recentHand == "right" {
            rightElementSprite?.removeFromParent()
            rightElement = ""
        }
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
        run(sound)
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
    }
}
