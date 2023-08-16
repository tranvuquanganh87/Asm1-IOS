//
//  ChessGame+Copy.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

extension ChessGame: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChessGame(gameMode: GameMode(minuts: 30, increment: 0, mode: .computer))
        copy.currentPlayer.value = currentPlayer.value
        copy.board.value = board.value
        return copy
    }
}
