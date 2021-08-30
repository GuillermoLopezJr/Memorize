//
//  MemoryGame.swift
//  memorize
//
//  Created by Guillermo Lopez on 8/12/21.
//

import Foundation
import SwiftUI

// This is the Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    
    // can look at it but can't modify
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyOneFaceUpCard: Int? {
        get { return cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach({cards[$0].isFaceUp = ($0 == newValue)}) }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            // if there is already a face up card, check to see if the next card matches.
            // if so designate both cards as a match
            // if no match flip both cards down
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // both cards are face up, so set index of first face up card to be nil
                cards[chosenIndex].isFaceUp = true
            } else {
                // turn all cards face down
                indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add number of paris of cards x 2 to cards array
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }

    // namespace the Card
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }
        else {
            return nil;
        }
    }
}

struct MemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
