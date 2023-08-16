//
//  GaneSelectorView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

final class GameViewModel: ObservableObject {

    @Published var board: Board = []
    @Published var currentPlayer = Player.white
    @Published var whiteRemainigTime: String = ""
    @Published var blackRemainigTime: String = ""
    @Published var whitePlayerName = "Player 1"
    @Published var blackPlayerName = ""
    var pieces: [Piece] { chessGame.activePieces }

    private var disposables = Set<AnyCancellable>()
    private let chessGame: ChessGame
    private let ai: AIChess
    private let gameMode: GameMode


    init(gameMode: GameMode) {
        self.gameMode = gameMode
        chessGame = ChessGame(gameMode: gameMode)
        ai = AIChess(chessGame: chessGame)
        chessGame.currentPlayer.assign(to: \.currentPlayer, on: self).store(in: &disposables)
        chessGame.board.assign(to: \.board, on: self).store(in: &disposables)
        chessGame.whiteRemainingTime.map { $0.chessyTime() }.assign(to: \.whiteRemainigTime, on: self).store(in: &disposables)
        chessGame.blackRemainingTime.map { $0.chessyTime() }.assign(to: \.blackRemainigTime, on: self).store(in: &disposables)
        blackPlayerName = gameMode.mode == .computer  ? "Computer" : "Player 2"
    }
    
    
    func didMove(move: Move) {
        guard ai.isThinking == false else { return }
        chessGame.play(move: move)
        if currentPlayer == .black && gameMode.mode == .computer {
            ai.bestMove { move in
                if let move = move {
                    self.chessGame.play(move: move)
                }
            }
        }
    }

    func indexOf(_ piece: Piece) -> Position {
        chessGame.indexOf(piece)
    }

    func start() {
        chessGame.start()
    }
}
