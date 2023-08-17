//
//  Position.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

struct Position {
    let x, y: Int
}

func +(lhs: Position, rhs: Position) -> Position {
    return Position(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
}

extension Position: Equatable {
}
