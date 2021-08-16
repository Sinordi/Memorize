//
//  Theme's.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 19.01.2021.
//

import Foundation
import SwiftUI


struct Theme<ColorForTheme, CardContent, NameOfTheme> {
    var nameOfTheme: NameOfTheme
    var emojiForTheme: Array<CardContent>
    var numberPairsOfCard: Int?
    var colorForTheme: ColorForTheme
}

var standartTheme = Theme<Color, String, String>(nameOfTheme: "standartTheme",
                          emojiForTheme: ["😀","😁","😅","😝","🥲","🤩"],
                          colorForTheme: Color.orange)

var zooTheme = Theme<Color, String, String>(nameOfTheme: "Zoo",
                       emojiForTheme: ["🐶","🐱","🐭","🐹","🐰"],
                       numberPairsOfCard: 3,
                       colorForTheme: .green)


var womenTheme = Theme<Color, String , String>(nameOfTheme: "WomenTheme",
                       emojiForTheme: ["🤦‍♀️","🤷‍♀️","👩🏻","👵🏼","🧕"],
                       numberPairsOfCard: 5,
                       colorForTheme: .red)

var balls = Theme<Color, String , String>(nameOfTheme: "Balls", emojiForTheme: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱"], numberPairsOfCard: 9, colorForTheme: .yellow)


var themes = [standartTheme, zooTheme, womenTheme, balls]






