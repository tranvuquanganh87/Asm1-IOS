//
//  Array+.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

extension Array where Element == [Piece?] {
    subscript(_ position: Position) -> Piece? {
        get {
            self[position.x][position.y]
        }
        set(newValue) {
            self[position.x][position.y] = newValue
        }
    }
}
