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
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edigeLineWidth)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.blue)
            }
        }
        
        .font(Font.system(size: fontSize(for: size)))
        
    }
    
    // MARK: - Constantes

    let cornerRadius: CGFloat =  10.0
    let edigeLineWidth: CGFloat = 3

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let memoryGameViewModel = MemoryGameViewModel()
        MemoryGameView(viewModel: memoryGameViewModel)
    }
}
