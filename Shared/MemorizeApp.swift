//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Allana Santamaria on 26/05/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let memoryGameViewModel = MemoryGameViewModel()
            MemoryGameView(viewModel: memoryGameViewModel)
        }
    }
}
