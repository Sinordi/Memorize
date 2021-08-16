//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 12.01.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
