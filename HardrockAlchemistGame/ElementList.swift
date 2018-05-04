//
//  ElementList.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-04-23.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import Foundation
//Water (smoke on the water), Earth (Wind fire), Air (guitar model for amateurs), Fire ()
let allItems = [["element1": "Earth", "element2": "Water", "discovery": "Mud",
                 "info": "Reason of the nickname to Waters, because he liked to play in it"],
                ["element1": "Mud", "element2": "Fire", "discovery": "Brick",
                 "info": "\"Hey! Teachers! Leave them kids alone\""],
                ["element1": "Brick", "element2": "Brick", "discovery": "Wall",
                 "info": "So you figured that out as well. Have you heard the whole album yet?"],
                ["element1": "Wall", "element2": "Wall", "discovery": "Building",
                 "info": "Why a building? Well, this game is about rock, not house"],
                ["element1": "Water", "element2": "Mud", "discovery": "Lake",
                 "info": "Everybody sings about lakes. Think of something else"],
                ["element1": "Water", "element2": "Lake", "discovery": "Sea",
                 "info": "Don't follow the stream"],
                ["element1": "Lake", "element2": "Lake", "discovery": "Sea",
                 "info": "Don't follow the stream"],
                ["element1": "Water", "element2": "Air", "discovery": "Cloud",
                 "info": "WTF my computer broke down, all my new plug-ins are gone"],
                ["element1": "Air", "element2": "Fire", "discovery": "Energy",
                 "info": "Or you could just do a really fast powerslide"], //More of these?
                ["element1": "Water", "element2": "Cloud", "discovery": "Rain",
                 "info": "Somebody call Rihanna!"],
                ["element1": "Energy", "element2": "Cloud", "discovery": "Lightning",
                 "info": "\"Very, very frightning\""],
                ["element1": "Air", "element2": "Air", "discovery": "Pressure",
                 "info": "The obtrusive feeling when trying to come up with a good flavour text"],
                ["element1": "Earth", "element2": "Earth", "discovery": "Pressure",
                 "info": "The obtrusive feeling when trying to come up with a good flavour text"],
                ["element1": "Air", "element2": "Cloud", "discovery": "Sky",
                 "info": "Every positive lyric writer think they can tounch this. They're also always high"],
                ["element1": "Sky", "element2": "Fire", "discovery": "Sun",
                 "info": "Here it comes!"],
                ["element1": "Planet", "element2": "Fire", "discovery": "Sun",
                 "info": "Here it comes!"],
                ["element1": "Earth", "element2": "Sky", "discovery": "Planet",
                 "info": "I don't believe in humans"],
                ["element1": "Earth", "element2": "Sun", "discovery": "Planet", "info":
                    "I don't believe in humans"],
                ["element1": "Planet", "element2": "Sun", "discovery": "Star",
                 "info": "How I wonder where you are..."],
                ["element1": "Air", "element2": "Pressure", "discovery": "Wind",
                 "info": "You're telling me the answer has been here the whole time?"],
                ["element1": "Sea", "element2": "Wind", "discovery": "Wave", "info": ""],
                ["element1": "Wave", "element2": "Air", "discovery": "Sound", "info": ""],
                ["element1": "Sound", "element2": "Sound", "discovery": "Music",
                 "info": "Can appearantly give life to hills"], 
                ["element1": "Sound", "element2": "Human", "discovery": "Music", "info": ""],
                ["element1": "Earth", "element2": "Fire", "discovery": "Lava", "info": ""],
                ["element1": "Earth", "element2": "Lava", "discovery": "Hell",
                 "info": "Also a small village in Norway. Coincidence?"],
                ["element1": "Air", "element2": "Lava", "discovery": "Stone",
                 "info": "Keep on rolling"],
                ["element1": "Fire", "element2": "Stone", "discovery": "Metal", "info": ""],
                ["element1": "Music", "element2": "Metal", "discovery": "Heavy Metal", "info": ""],
                ["element1": "Energy", "element2": "Metal", "discovery": "Electricity",
                 "info": "This is information about electricity"],
                ["element1": "Stone", "element2": "Pressure", "discovery": "Sand", "info": ""],
                ["element1": "Fire", "element2": "Sand", "discovery": "Glass",
                 "info": "Still not broken? Turn up that bass amp!"],
                ["element1": "Glass", "element2": "Sand", "discovery": "Time",
                 "info": "Too short when playing your own solo, eternity when someone else does"],
                ["element1": "Hourglass", "element2": "Human", "discovery": "Timing", "info": ""], //Make songs, rythm, riff, mm with this?
                ["element1": "Lightning", "element2": "Lake", "discovery": "Bacteria Cell", "info": ""], //Make more of these?
                ["element1": "Lightning", "element2": "Sea", "discovery": "Bacteria Cell", "info": ""],
                ["element1": "Time", "element2": "Bacteria Cell", "discovery": "Life", "info": ""],
                ["element1": "Life", "element2": "Lake", "discovery": "Animal", "info": ""],
                ["element1": "Life", "element2": "Sea", "discovery": "Animal", "info": ""],
                ["element1": "Life", "element2": "Earth", "discovery": "Plant", "info": ""],
                ["element1": "Animal", "element2": "Time", "discovery": "Human", "info": ""],
                ["element1": "Earth", "element2": "Time", "discovery": "Oil", "info": ""],
                ["element1": "Human", "element2": "Oil", "discovery": "Plastic", "info": ""],
                ["element1": "Star", "element2": "Plastic", "discovery": "Glitter", "info": ""],
                ["element1": "Fire", "element2": "Pressure", "discovery": "Pyro", "info": "Always be prepared"], //Easter egg?
                ["element1": "Human", "element2": "Human", "discovery": "Love", "info": ""],
                ["element1": "Plant", "element2": "Cloud", "discovery": "Cotton", "info": ""],
                ["element1": "Human", "element2": "Metal", "discovery": "Tool", "info": ""],
                ["element1": "Tool", "element2": "Cotton", "discovery": "Thread", "info": ""],
                ["element1": "Thread", "element2": "Thread", "discovery": "Rope", "info": ""],
                ["element1": "Thread", "element2": "Tool", "discovery": "Clothes", "info": ""],
                ["element1": "Clothes", "element2": "Clothes", "discovery": "Outfit",
                 "info": "Never think you were the first band to wear all black on stage"],
                ["element1": "Glitter", "element2": "Clothes", "discovery": "Dance Band",
                 "info": "Who put this in? Seriously?"], //Easter egg?
                ["element1": "Rope", "element2": "Electricity", "discovery": "Cable",
                 "info": "Are you the one making a knot? Get out of here!"],
                ["element1": "Human", "element2": "Sound", "discovery": "Singer",
                 "info": "If they put as much effort in knowing the lyrics as asking for more monitor they would propably be decent musicians"],
                ["element1": "Singer", "element2": "Electricity", "discovery": "Microphone",
                 "info": "It does sound better if you make out with it"],
                ["element1": "Microphone", "element2": "Cable", "discovery": "XLR Cable", "info": "The mic will definatley detach if you spin it around every single song. It is known"],
                ["element1": "Hell", "element2": "Animal", "discovery": "Satan",
                 "info": "From whence you came, you shall remain, until you are complete again"],
                ["element1": "Hell", "element2": "Human", "discovery": "Satan",
                 "info": "From whence you came, you shall remain, until you are complete again"],
                ["element1": "Satan", "element2": "Heavy Metal", "discovery": "Death Metal",
                 "info": "As long as you growl your mother won't be able to hear the lyrics"],
                ["element1": "Plant", "element2": "Time", "discovery": "Tree", "info": ""],
                ["element1": "Tool", "element2": "Tree", "discovery": "Wood", "info": ""],
                ["element1": "Wood", "element2": "Plastic", "discovery": "Drum Kit",
                 "info": "Always complains on the kit at the venue, but to lazy to bring their own"],
                ["element1": "Drum Kit", "element2": "Musician", "discovery": "Drummer",
                 "info": "Softer? What do you mean softer? Who plays like that?"], //Make more of these with human?
                ["element1": "Music", "element2": "Human", "discovery": "Musician",
                 "info": "I can't listen to this song anymore, the kick isn't clicky enough"],
                ["element1": "Musician", "element2": "Pressure", "discovery": "Stage Fright",
                 "info": "Now you know why there are 1 bottle of wine and 30 beer cans on my rider?"], //Easter egg?
                ["element1": "Wood", "element2": "Tool", "discovery": "Drumsticks",
                 "info": "Ever wondered why it looks like a sawdust behind the drums? "],
                ["element1": "Metal", "element2": "Stone", "discovery": "Knife", "info": ""],
                ["element1": "Animal", "element2": "Knife", "discovery": "Leather", "info": ""], //Make more of these?
                ["element1": "Leather", "element2": "Metal", "discovery": "Studded belt", "info": ""],
                ["element1": "Leather", "element2": "Clothes", "discovery": "Leather Jacket", "info": ""],
                ["element1": "Wood", "element2": "Electricity", "discovery": "Guitar", "info": ""],
                ["element1": "Guitar", "element2": "Musician", "discovery": "Guitarist",
                 "info": "Hey what du you mean we can't have a guitar solo in every song?"], //Make more of these with human?
                ["element1": "Guitarist", "element2": "Love", "discovery": "Fan", "info": ""],
                ["element1": "Drummer", "element2": "Love", "discovery": "Fan", "info": ""],
                ["element1": "Singer", "element2": "Love", "discovery": "Fan", "info": ""],
                ["element1": "Fan", "element2": "Fan", "discovery": "Crowd", "info": ""],
                ["element1": "Crowd", "element2": "Wave", "discovery": "Crowd Surfing", "info": ""],
                ["element1": "Cable", "element2": "Guitar", "discovery": "Tele Cable", "info": ""],
                ["element1": "Heavy Metal", "element2": "Fan", "discovery": "Fist Sign", "info": ""], //Easter egg?
                ["element1": "Guitar", "element2": "Guitar", "discovery": "Double Neck",
                 "info": "Why don't you play both at the same time?"],
                ["element1": "Satan", "element2": "Fan", "discovery": "Satanism", "info": ""], //Easter egg?
                ["element1": "Sound", "element2": "Electricity", "discovery": "Amplifier", "info": ""],
                ["element1": "Amplifier", "element2": "Microphone", "discovery": "PA System", "info": ""],
                ["element1": "Tree", "element2": "Sun", "discovery": "Fruit", "info": ""],
                ["element1": "Fruit", "element2": "Time", "discovery": "Alcohol", "info": ""],
                ["element1": "Earth", "element2": "Plant", "discovery": "Crops", "info": ""],
                ["element1": "Crops", "element2": "Alcohol", "discovery": "Beer", "info": ""], //Easter egg?
                ["element1": "Plastic", "element2": "Metal", "discovery": "Pin", "info": ""], //Easter egg?
                ["element1": "Musician", "element2": "Musician", "discovery": "Band", "info": ""], //Make more of these?
                ["element1": "Crowd", "element2": "Band", "discovery": "Gig", "info": ""],
                ["element1": "Band", "element2": "Clothes", "discovery": "Merch", "info": ""],
                ["element1": "Tree", "element2": "Pressure", "discovery": "Paper", "info": ""],
                ["element1": "Paper", "element2": "Fan", "discovery": "Poster", "info": ""], //Easter egg?
                ["element1": "Paper", "element2": "Musician", "discovery": "Autograph", "info": ""], //Easter egg?
                ["element1": "Paper", "element2": "Gig", "discovery": "Ticket", "info": ""]]

