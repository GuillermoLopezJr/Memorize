//
//  memorizeApp.swift
//  memorize
//
//  Created by Guillermo Lopez on 7/28/21.
//

import SwiftUI

@main
struct memorizeApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
