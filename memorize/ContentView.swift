//
//  ContentView.swift
//  memorize
//
//  Created by Guillermo Lopez on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🍺", "🍙", "🍰", "🥜", "🍭", "🍓", "🍏", "🍎", "🍐", "🍋",
                  "🍌", "🍉", "🍇", "🫐", "🍈", "🍒", "🍑", "🥭"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
    
    var remove: some View {
        
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
                VStack {
                    Image(systemName: "plus.circle")
                }
            })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
