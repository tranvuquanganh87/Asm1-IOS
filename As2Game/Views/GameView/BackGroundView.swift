//
//  BackGroundView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

import SwiftUI

struct BackgroundView: View {
    var body: some View {
//        Image("black-special")
//            .opacity(0.05)
//            .blur(radius: 1)
        Color("black-special")
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
