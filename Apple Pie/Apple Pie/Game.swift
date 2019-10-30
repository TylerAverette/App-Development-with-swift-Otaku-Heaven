//
//  Game.swift
//  Apple Pie
//
//  Created by Student User on 3/26/19.
//  Copyright © 2019 Student User. All rights reserved.
//

import Foundation

struct Game{
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    /* This function takes the player's guessed letter and appends it to a collection
       of guessed letters. */
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
    /* This function takes a player's guesses a forms a word with spaces for
       characters that have not been guessed yet. */
    var formattedWord: String{
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }
            else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }
}

