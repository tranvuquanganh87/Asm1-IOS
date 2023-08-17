//
//  GameView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

import SwiftUI

struct GameView: View {
    
    @ObservedObject private var viewModel: GameViewModel
    @State private var currentPiece: (Piece?, CGSize) = (nil, .zero)
    @State var isRotatingWhite = true
    
    init(gameMode: GameMode) {
        viewModel = GameViewModel(gameMode: gameMode)
    }
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                HUDView(name: viewModel.blackPlayerName, time: viewModel.blackRemainigTime, isCurrentPlayer: viewModel.currentPlayer == .black)
                
                ZStack(alignment: .bottomLeading) {
                    ChessBoardView()
                    ForEach(viewModel.pieces) { piece in
                        Image(piece.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(self.currentPiece.0 == piece ? 1.3 : 1)
                            .offset(self.currentPiece.0 == piece ? self.currentPiece.1 : self.viewModel.indexOf(piece).size)
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8)
                            .gesture(self.dragGesture(piece))
                            .animation(.easeInOut(duration: 0.2))
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.width)
                
                HUDView(name: viewModel.whitePlayerName, time: viewModel.whiteRemainigTime, isCurrentPlayer: viewModel.currentPlayer == .white)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.viewModel.start()
        }
    }
    
    private func dragGesture(_ piece: Piece) -> _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged { dragValue in
                self.currentPiece = (piece, self.viewModel.indexOf(piece).size + dragValue.translation)
                self.viewModel.objectWillChange.send()
            }
            .onEnded {
                self.currentPiece = (nil, .zero)
                let finalPosition = self.viewModel.indexOf(piece) + Position($0.translation)
                let move = Move(start: self.viewModel.indexOf(piece), end: finalPosition)
                self.viewModel.didMove(move: move)
            }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameMode: GameMode(minuts: 1, increment: 0, mode: .computer))
    }
}


