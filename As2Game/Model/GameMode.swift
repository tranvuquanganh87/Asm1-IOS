//
//  GameMode.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

struct GameMode: CustomStringConvertible, Identifiable {
    let id = UUID()

    let minuts: Int
    let increment: Int
    let mode: Mode

    var description: String {
        "\(minuts)+\(increment)"
    }

    enum Mode: String {
        case computer
        case localFriend = "Friend"
    }
}

