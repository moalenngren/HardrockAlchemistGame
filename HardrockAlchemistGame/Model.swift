//
//  Model.swift
//  HardrockAlchemistGame
//
//  Created by ITHS on 2018-05-01.
//  Copyright © 2018 MoaLenngren. All rights reserved.
//

import Foundation

var defaults = UserDefaults.standard
var discoveredItems = ["Earth", "Air", "Fire", "Water"]


func saveInventoryToUserDefaults(inventoryItems : [String]) {
    defaults.set(inventoryItems, forKey: "inventory")
}

func loadInventoryFromDefaults() {
    if let inventoryItems = defaults.value(forKey: "inventory") as? [String] {
        discoveredItems = inventoryItems
    } else {
        discoveredItems = ["Earth", "Air", "Fire", "Water"]
    }
}
