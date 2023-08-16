//
//  PieceType.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

enum PieceType {
    case pawn
    case rook
    case knight
    case bishop
    case queen
    case king

    var value: Int {
        switch self {
        case .pawn: return 1
        case .rook: return 5
        case .knight: return 3
        case .bishop: return 3
        case .queen: return 9
        case .king: return 25
        }
    }
}

extension Piece {
    var imageName: String {
        switch type {
        case .pawn: return "pawn_\(player == .white ? "w" : "b")"
        case .rook: return "rook_\(player == .white ? "w" : "b")"
        case .knight: return "knight_\(player == .white ? "w" : "b")"
        case .bishop: return "bishop_\(player == .white ? "w" : "b")"
        case .queen: return "queen_\(player == .white ? "w" : "b")"
        case .king: return "king_\(player == .white ? "w" : "b")"
        }
    }
}
