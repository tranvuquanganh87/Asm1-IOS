//
//  GameViewModel.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//


import Foundation
import UIKit
import Combine

final class GameViewModel: ObservableObject {
    
    @Published var board: Board = []
    @Published var currentPlayer = Player.white
    @Published var whiteRemainigTime: String = ""
    @Published var blackRemainigTime: String = ""
    @Published var whitePlayerName = "Player 1"
    @Published var blackPlayerName = ""
    var pieces: [Piece] { chessGame.activePieces }
    
    private var disposables = Set<AnyCancellable>()
    private var chessGame: ChessGame
    private var ai: AIChess
    private var gameMode: GameMode
    
    
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
    
    func resetGame(with gameMode: GameMode){
        chessGame.reset()
    }
    func validMovements(for position: Position) -> [Move] {
        guard let piece = board[position] else {
            return []
        }
        return PieceMovement().validMovementsFor(position: position, with: piece, withBoard: board)
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
