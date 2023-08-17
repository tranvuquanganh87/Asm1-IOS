//
//  Piece.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

import UIKit

class Piece: Identifiable {
    let uuid = UUID()

    let player: Player
    let type: PieceType

    init(type: PieceType, player: Player) {
        self.type = type
        self.player = player
    }


}

extension Piece: Equatable {
    static func == (lhs: Piece, rhs: Piece) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
