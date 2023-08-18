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
    @State private var selectedPiece: Piece?
    
    init(gameMode: GameMode) {
        viewModel = GameViewModel(gameMode: gameMode)
    }
    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack(spacing: 20) {
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
                            .onTapGesture {
                                self.selectedPiece = piece
                            }
                    }
                    
                    if let selectedPiece = selectedPiece {
                        let piecePosition = self.viewModel.indexOf(selectedPiece) // Convert Piece to Position
                        let validMovements = self.viewModel.validMovements(for: piecePosition)
                        
                        let identifiableMoves = validMovements.map { IdentifiableMove(move: $0) }
                        ForEach(identifiableMoves) { identifiableMove in
                            let position = identifiableMove.move.end // Access the end position of the valid move
                            Rectangle()
                                .foregroundColor(Color.green.opacity(0.5))
                                .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.width / 8)
                                .overlay{
                                    Text("\(position.x)" + "\(position.y)")
                                }
                                .position(
                                    CGPoint(
                                        x: CGFloat(position.x) * UIScreen.main.bounds.width / 8 + UIScreen.main.bounds.width / 16,
                                        y: CGFloat(position.y) * UIScreen.main.bounds.width / 8 + UIScreen.main.bounds.width / 16
                                    )
                                )
                            
                                .animation(.easeInOut(duration: 0.2))
                        }
                    }
                    
                }
                .frame(maxHeight: UIScreen.main.bounds.width)
                VStack(spacing:10){
                    HUDView(name: viewModel.whitePlayerName, time: viewModel.whiteRemainigTime, isCurrentPlayer: viewModel.currentPlayer == .white)
                    
                    Button(){
                        resetGame()
                    } label: {
                        Text("Restart")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: 120, minHeight: 65)
                    .background(Color.purple)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius:25))
                }
               
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
                self.selectedPiece = nil
            }
            .onEnded {
                self.currentPiece = (nil, .zero)
                let finalPosition = self.viewModel.indexOf(piece) + Position($0.translation)
                let move = Move(start: self.viewModel.indexOf(piece), end: finalPosition)
                self.viewModel.didMove(move: move)
            }
    }
    
    private func resetGame() {
        viewModel.resetGame(with: GameMode(minuts: 1, increment: 0, mode: .computer))
    }
}
struct IdentifiableMove: Identifiable {
    let id = UUID()
    let move: Move
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameMode: GameMode(minuts: 1, increment: 0, mode: .computer))
    }
}


