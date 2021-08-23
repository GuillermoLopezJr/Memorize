//
//  MemoryGame.swift
//  memorize
//
//  Created by Guillermo Lopez on 8/12/21.
//

import Foundation

// This is the Model
struct MemoryGame<CardContent> {
    
    // can look at it but can't modify
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosen card: \(card)")
        print("cards: \(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        // chosen card was not found in array. NOT Possible.
        return -1
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

