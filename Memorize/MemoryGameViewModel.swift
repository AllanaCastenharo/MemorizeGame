//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Allana Santamaria on 26/05/21.
//

import Foundation

class MemoryGameViewModel: ObservableObject {
    
    @Published private var model: MemoryGameModel<String> = MemoryGameViewModel.CreateMemoryGame()
    
    static func CreateMemoryGame() -> MemoryGameModel<String> {
        let emojis = ["🐶", "❤️", "👻"]
        return MemoryGameModel<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    var cards: Array<MemoryGameModel<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    func choose(card:MemoryGameModel<String>.Card) {
//        objectWillChange.send()
        model.choose(card: card)
        
    }
}
