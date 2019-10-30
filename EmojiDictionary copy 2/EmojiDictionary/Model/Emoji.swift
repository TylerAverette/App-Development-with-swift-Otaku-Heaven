//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Student User on 8/28/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

class Emoji: Codable{
    let symbol: String
    let name: String
    let decsription: String
    let usage: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("Emojis").appendingPathExtension("plist")
    
    init(symbol: String, name: String, description: String, usage: String){
        self.symbol = symbol
        self.name = name
        self.decsription = description
        self.usage = usage
    }
    
    static func saveToFile(emojis: [Emoji]){
        let propertyListEncoder = PropertyListEncoder()
        let encodedEmojiArray = try? propertyListEncoder.encode(emojis)
        
        try? encodedEmojiArray?.write(to: Emoji.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji]?{
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedEmojiArrayData = try? Data(contentsOf: Emoji.archiveURL),
            let decodedEmojiArray = try? propertyListDecoder.decode(Array<Emoji>.self, from: retrievedEmojiArrayData){
            return decodedEmojiArray
                }
        else{
            return nil
        }
    }
    
    static func loadSampleEmojis() -> [Emoji]{
    
        return 	[
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think, displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something, attractive"),
            Emoji(symbol: "👮‍♂️", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "Extreme sadness"),
            Emoji(symbol: "💤", name: "Snoring", description: "Three blue \'z \'s", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "Completion"),
            Emoji(symbol: "🤣", name: "Rolling on the floor laughing Face", description: "A smiley face tiltled sideways, with eyes closed and tears coming from eyes.", usage: "laughter"),
            Emoji(symbol: "😟", name: "Worried Face", description: "A face with a frown and raised eyebrows.", usage: "Worrying")
        ]
    }
}
