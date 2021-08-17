//
//  memorizeApp.swift
//  memorize
//
//  Created by Guillermo Lopez on 7/28/21.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
