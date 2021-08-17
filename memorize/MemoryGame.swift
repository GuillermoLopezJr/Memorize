//
//  MemoryGame.swift
//  memorize
//
//  Created by Guillermo Lopez on 8/12/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    // can look at it but can't modify
    private(set) var cards: Array<Card>
    
    func choose(_ : Card) {
        
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add number of paris of cards x 2 to cards array
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    // namespace the Card
    struct Card: Identifiable {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }

}

