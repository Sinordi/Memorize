//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 13.01.2021.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String, Color, String> = EmojiMemoryGame.createMemoryGame(theme: themes[Int.random(in: 0...(themes.count - 1))])
    

    
    private static func createMemoryGame(theme: Theme<Color, String, String>) ->  MemoryGame<String, Color, String> {
        let emoji = theme.emojiForTheme

        return MemoryGame<String, Color, String>(nameOfTheme: theme.nameOfTheme, color: theme.colorForTheme, numberOfPairsOfCards: theme.numberPairsOfCard) {pairIndex in
            return emoji[pairIndex]
        }
    }
    
    
                                                               
    
    // MARK: - Accses to the Model
    
    var cards: Array<MemoryGame<String, Color, String>.Card> {
        model.cards
    }
    
    var colorForheme: Color {
        model.colorForTheme
    }
    
    var nameOfTheme: String {
        model.nameOfTheme
    }
    
    var sum: Int {
        model.sum
    }
    
   // MARK: Intent(s)
    
    func choose(card: MemoryGame<String, Color, String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        let randomEmoji = Int.random(in: 0...(themes.count - 1))
        model.newGame(with: themes[randomEmoji]) {pairIndex in
            return themes[randomEmoji].emojiForTheme[pairIndex]
        }
        
        
    }
    
    
}
