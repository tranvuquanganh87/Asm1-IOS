//
//  Move.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

struct Move : Identifiable  {
    let id = UUID()
    let start: Position
    let end: Position
}
