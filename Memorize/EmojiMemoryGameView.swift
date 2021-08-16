//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Сергей Кривошапко on 12.01.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var rundomNumberOfTheme = Int.random(in: 0...(themes.count - 1))
    var body: some View {
        
        VStack {
            
            HStack {
                Text("\(viewModel.sum)")
                Text(viewModel.nameOfTheme)
                Button(action: {
                    withAnimation(.easeInOut(duration: 1)) {
                        viewModel.newGame()
                    }
                    
                }
                , label: {
                    Text("NewGame")
                })
            }
            Grid(viewModel.cards) {card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.linear(duration: 1)) {
                            viewModel.choose(card: card)
                        }
                        
                    }
                    
                    .padding(5)
            }
            
            .padding()
            .foregroundColor(viewModel.colorForheme)
        }
    }
}



struct CardView: View {
    var card: MemoryGame<String, Color, String>.Card
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    
    @ViewBuilder private func body (for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngel: Angle.degrees(110 - 90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched
                                ?
                                Animation.easeInOut(duration: 2)
                                :
                                .default)
            }
            .font(Font.system(size: min(size.width , size.height) * fontScaleFactor))
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
            
            
        }
    }
    
    
    
    // MARK: Drawing Constants
    
    
    private let fontScaleFactor: CGFloat = 0.7
}






// ******************************************************* //


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        return Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                .previewDevice("iPhone 12")
        }
    }
}

