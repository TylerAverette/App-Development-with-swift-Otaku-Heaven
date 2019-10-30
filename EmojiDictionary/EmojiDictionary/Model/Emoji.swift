//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Student User on 8/28/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

class Emoji{
    let symbol: String
    let name: String
    let decsription: String
    let usage: String
    
    init(symbol: String, name: String, description: String, usage: String){
        self.symbol = symbol
        self.name = name
        self.decsription = description
        self.usage = usage
    }
}
