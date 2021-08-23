//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Guillermo Lopez on 8/12/21.
//

import SwiftUI

// itermediary between model and view
// job is to protect the model
// only the view model can change the model
// Observable objects can publish to the world that something changed
class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🍺", "🍙", "🍰", "🥜", "🍭", "🍓", "🍏", "🍎", "🍐", "🍋","🍌", "🍉", "🍇", "🫐", "🍈", "🍒", "🍑", "🥭"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
           emojis[pairIndex]
        }
    }
    
    // if this was not private view could change model directly
    // anything model changes it will auto call objectWillSend.send()
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
