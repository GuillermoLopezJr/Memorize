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
class EmojiMemoryGame {
    
    static let emojis = ["🍺", "🍙", "🍰", "🥜", "🍭", "🍓", "🍏", "🍎", "🍐", "🍋",
                  "🍌", "🍉", "🍇", "🫐", "🍈", "🍒", "🍑", "🥭"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
           emojis[pairIndex]
        }
    }
    
    // if this was not private view could change model directly
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
}
