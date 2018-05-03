//
//  ElementList.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-04-23.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import Foundation

let allItems = [["element1": "Earth", "element2": "Water", "discovery": "Mud", "info": "The brown, sticky mess left on the ground after a rainy day witch destroys your new cool shoes"],
                ["element1": "Mud", "element2": "Fire", "discovery": "Brick"],
                ["element1": "Brick", "element2": "Brick", "discovery": "Wall"],
                ["element1": "Wall", "element2": "Wall", "discovery": "Building"],
                ["element1": "Water", "element2": "Mud", "discovery": "Lake"],
                ["element1": "Water", "element2": "Lake", "discovery": "Sea"],
                ["element1": "Lake", "element2": "Lake", "discovery": "Sea"],
                ["element1": "Water", "element2": "Air", "discovery": "Cloud"],
                ["element1": "Air", "element2": "Fire", "discovery": "Energy"], //More of these?
                ["element1": "Water", "element2": "Cloud", "discovery": "Rain"],
                ["element1": "Energy", "element2": "Cloud", "discovery": "Lightning"],
                ["element1": "Air", "element2": "Air", "discovery": "Pressure"],
                ["element1": "Earth", "element2": "Earth", "discovery": "Pressure"],
                ["element1": "Air", "element2": "Cloud", "discovery": "Sky"],
                ["element1": "Sky", "element2": "Fire", "discovery": "Sun"],
                ["element1": "Planet", "element2": "Fire", "discovery": "Sun"],
                ["element1": "Earth", "element2": "Sky", "discovery": "Planet"],
                ["element1": "Earth", "element2": "Sun", "discovery": "Planet"],
                ["element1": "Planet", "element2": "Sun", "discovery": "Star"],
                ["element1": "Air", "element2": "Pressure", "discovery": "Wind"],
                ["element1": "Sea", "element2": "Wind", "discovery": "Wave"],
                ["element1": "Wave", "element2": "Air", "discovery": "Sound"],
                ["element1": "Sound", "element2": "Sound", "discovery": "Music"], //Or harmony?
                ["element1": "Sound", "element2": "Human", "discovery": "Music"],
                ["element1": "Earth", "element2": "Fire", "discovery": "Lava"],
                ["element1": "Earth", "element2": "Lava", "discovery": "Hell"],
                ["element1": "Air", "element2": "Lava", "discovery": "Stone"],
                ["element1": "Fire", "element2": "Stone", "discovery": "Metal"],
                ["element1": "Music", "element2": "Metal", "discovery": "Heavy Metal"],
                ["element1": "Energy", "element2": "Metal", "discovery": "Electricity", "info": "This is information about electricity"], //Works
                ["element1": "Stone", "element2": "Pressure", "discovery": "Sand"],
                ["element1": "Fire", "element2": "Sand", "discovery": "Glass"],
                ["element1": "Glass", "element2": "Sand", "discovery": "Time"],
                ["element1": "Hourglass", "element2": "Human", "discovery": "Timing"], //Make songs, rythm, riff, mm with this?
                ["element1": "Lightning", "element2": "Lake", "discovery": "Bacteria Cell"], //Make more of these?
                ["element1": "Lightning", "element2": "Sea", "discovery": "Bacteria Cell"],
                ["element1": "Time", "element2": "Bacteria Cell", "discovery": "Life"],
                ["element1": "Life", "element2": "Lake", "discovery": "Animal"],
                ["element1": "Life", "element2": "Sea", "discovery": "Animal"],
                ["element1": "Life", "element2": "Earth", "discovery": "Plant"],
                ["element1": "Animal", "element2": "Time", "discovery": "Human"],
                ["element1": "Earth", "element2": "Time", "discovery": "Oil"],
                ["element1": "Human", "element2": "Oil", "discovery": "Plastic"],
                ["element1": "Star", "element2": "Plastic", "discovery": "Glitter"],
                ["element1": "Fire", "element2": "Pressure", "discovery": "Pyro"], //Easter egg?
                ["element1": "Human", "element2": "Human", "discovery": "Love"],
                ["element1": "Plant", "element2": "Cloud", "discovery": "Cotton"],
                ["element1": "Human", "element2": "Metal", "discovery": "Tool"],
                ["element1": "Tool", "element2": "Cotton", "discovery": "Thread"],
                ["element1": "Thread", "element2": "Thread", "discovery": "Rope"],
                ["element1": "Thread", "element2": "Tool", "discovery": "Clothes"],
                ["element1": "Clothes", "element2": "Clothes", "discovery": "Outfit"],
                ["element1": "Glitter", "element2": "Clothes", "discovery": "Dance Band"], //Easter egg?
                ["element1": "Rope", "element2": "Electricity", "discovery": "Cable"],
                ["element1": "Human", "element2": "Sound", "discovery": "Singer"],
                ["element1": "Singer", "element2": "Electricity", "discovery": "Microphone"],
                ["element1": "Microphone", "element2": "Cable", "discovery": "XLR Cable"],
                ["element1": "Hell", "element2": "Animal", "discovery": "Satan"],
                ["element1": "Hell", "element2": "Human", "discovery": "Satan"],
                ["element1": "Satan", "element2": "Heavy Metal", "discovery": "Death Metal"],
                ["element1": "Plant", "element2": "Time", "discovery": "Tree"],
                ["element1": "Tool", "element2": "Tree", "discovery": "Wood"],
                ["element1": "Wood", "element2": "Plastic", "discovery": "Drum Kit"],
                ["element1": "Drum Kit", "element2": "Musician", "discovery": "Drummer"], //Make more of these with human?
                ["element1": "Music", "element2": "Human", "discovery": "Musician"],
                ["element1": "Musician", "element2": "Pressure", "discovery": "Stage Fright"], //Easter egg?
                ["element1": "Wood", "element2": "Tool", "discovery": "Drumsticks"],
                ["element1": "Metal", "element2": "Stone", "discovery": "Knife"],
                ["element1": "Animal", "element2": "Knife", "discovery": "Leather"], //Make more of these?
                ["element1": "Leather", "element2": "Metal", "discovery": "Studded belt"],
                ["element1": "Leather", "element2": "Clothes", "discovery": "Leather Jacket"],
                ["element1": "Wood", "element2": "Electricity", "discovery": "Guitar"],
                ["element1": "Guitar", "element2": "Musician", "discovery": "Guitarist"], //Make more of these with human?
                ["element1": "Guitarist", "element2": "Love", "discovery": "Fan"],
                ["element1": "Drummer", "element2": "Love", "discovery": "Fan"],
                ["element1": "Singer", "element2": "Love", "discovery": "Fan"],
                ["element1": "Fan", "element2": "Fan", "discovery": "Crowd"],
                ["element1": "Crowd", "element2": "Wave", "discovery": "Crowd Surfing"],
                ["element1": "Cable", "element2": "Guitar", "discovery": "Tele Cable"],
                ["element1": "Heavy Metal", "element2": "Fan", "discovery": "Fist Sign"], //Easter egg?
                ["element1": "Guitar", "element2": "Guitar", "discovery": "Double Neck"],
                ["element1": "Satan", "element2": "Fan", "discovery": "Satanism"], //Easter egg?
                ["element1": "Sound", "element2": "Electricity", "discovery": "Amplifier"],
                ["element1": "Amplifier", "element2": "Microphone", "discovery": "PA System"],
                ["element1": "Tree", "element2": "Sun", "discovery": "Fruit"],
                ["element1": "Fruit", "element2": "Time", "discovery": "Alcohol"],
                ["element1": "Earth", "element2": "Plant", "discovery": "Crops"],
                ["element1": "Crops", "element2": "Alcohol", "discovery": "Beer"], //Easter egg?
                ["element1": "Plastic", "element2": "Metal", "discovery": "Pin"], //Easter egg?
                ["element1": "Musician", "element2": "Musician", "discovery": "Band"], //Make more of these?
                ["element1": "Crowd", "element2": "Band", "discovery": "Gig"],
                ["element1": "Band", "element2": "Clothes", "discovery": "Merch"],
                ["element1": "Tree", "element2": "Pressure", "discovery": "Paper"],
                ["element1": "Paper", "element2": "Fan", "discovery": "Poster"], //Easter egg?
                ["element1": "Paper", "element2": "Musician", "discovery": "Autograph"], //Easter egg?
                ["element1": "Paper", "element2": "Gig", "discovery": "Ticket"]]

