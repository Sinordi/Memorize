//
//  MemoryGame.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 13.01.2021.
//

import Foundation

struct MemoryGame<CardContent, ColorForTheme, NameOfTheme > where CardContent: Equatable {
    
    private (set) var cards: Array<Card>
    private (set) var colorForTheme: ColorForTheme
    private (set) var nameOfTheme: NameOfTheme
    private (set) var sum = 0
    
    private var i​ndexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp}.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    mutating func choose(card: Card) {
        
        if let chosenIndex: Int = cards.firstIndex(matching: card) ,
           !cards[chosenIndex].isFaceUp, //Запятая “,​”​ это наподобие ​последовательных​AND, когда сначала выполняется первое условие, а затем второе условие. В первом условии мы устанавливаем ​chosenIndex,​а во втором можем его использовать. (Л4)
           !cards[chosenIndex].isMatched {
            self.cards[chosenIndex].numberOfTurns += 1
            print(self.cards[chosenIndex].numberOfTurns)
            if let potentialMatchIndex = i​ndexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    
                    if cards[chosenIndex].numberOfTurns <= 2 {
                        if cards[potentialMatchIndex].numberOfTurns <= 2 {
                            sum += 2 }
                        else {
                            sum += 2 - cards[potentialMatchIndex].numberOfTurns}
                    } else {
                        if cards[potentialMatchIndex].numberOfTurns <= 2 {
                            sum += 2 - cards[potentialMatchIndex].numberOfTurns }
                        else {
                            sum += 2 - (cards[chosenIndex].numberOfTurns + cards[potentialMatchIndex].numberOfTurns)}
                    } // Подсчет очков
                }
                
                self.cards[chosenIndex].isFaceUp = true
                
            } else {
                i​ndexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    // Реализация кнопки NewGame
    mutating func newGame(with theme: Theme<ColorForTheme, CardContent, NameOfTheme>, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        sum = 0
        colorForTheme = theme.colorForTheme
        nameOfTheme = theme.nameOfTheme
        for pairIndex in 0..<theme.emojiForTheme.count {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    // Тут создается игра при первом запуске
    init (nameOfTheme: NameOfTheme, color: ColorForTheme, numberOfPairsOfCards: Int?, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        colorForTheme = color
        self.nameOfTheme = nameOfTheme
        for pairIndex in 0..<(numberOfPairsOfCards ?? Int.random(in: 2...5)) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var numberOfTurns: Int = 0
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    var bonusTimeLimit: TimeInterval = 6
}


