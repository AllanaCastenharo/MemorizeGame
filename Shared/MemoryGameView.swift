//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Allana Santamaria on 26/05/21.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        HStack {
             ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture(perform: { viewModel.choose(card: card)})
            }
        }
        .foregroundColor(.blue)
        .padding()
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    var body: some View {
        if card.isFaceUp {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content)
            })
        } else {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.blue)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let memoryGameViewModel = MemoryGameViewModel()
        MemoryGameView(viewModel: memoryGameViewModel)
    }
}
