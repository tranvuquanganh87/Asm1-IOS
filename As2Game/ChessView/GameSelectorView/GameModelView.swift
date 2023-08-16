//
//  GameModelView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

final class GameSelectorViewModel {
    let computerGameModes = [
        GameMode(minuts: 1, increment: 1, mode: .computer),
        GameMode(minuts: 3, increment: 2, mode: .computer),
        GameMode(minuts: 10, increment: 0, mode: .computer),
    ]
    let localFriendModes = [
        GameMode(minuts: 1, increment: 1, mode: .localFriend),
        GameMode(minuts: 3, increment: 2, mode: .localFriend),
        GameMode(minuts: 10, increment: 0, mode: .localFriend),
    ]

}
