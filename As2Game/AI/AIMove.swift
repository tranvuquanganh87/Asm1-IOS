//
//  AIMove.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

import GameplayKit

class AIMove: NSObject, GKGameModelUpdate {
    var value: Int = 0

    let move: Move

    init(move: Move) {
        self.move = move
    }
}
