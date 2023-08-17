//
//  ChessBoardView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

import SwiftUI

struct ChessBoardView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach((0...7).reversed(), id: \.self) { y in
                HStack(spacing: 0) {
                    ForEach(0...7, id: \.self) { x in
                        ((x + y).isMultiple(of: 2) ? Image("b_black") : Image("b_white"))
                            .resizable()
                    }
                }
            }
        }
    }
}

struct ChessBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ChessBoardView()
    }
}
