//
//  HudView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

struct HUDView: View {

    let name: String
    let time: String
    let isCurrentPlayer: Bool
    @State private var isRotating: Bool = false

    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.medium)
                .padding(.horizontal)
            Spacer()
            HStack {
                Image(systemName: "clock")
                Text(time)
            }

            .padding()
            .background(Color.green.opacity(0.7))

        }
        .foregroundColor(.white)
        .font(Font.system(.headline, design: .monospaced))
        .background(Color.secondary)
        .opacity(isCurrentPlayer ? 1 : 0.7)
        .blur(radius: isCurrentPlayer ? 0 : 0.4)

    }
}

struct HudView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(name: "Iván Ruiz", time: "04:03.15", isCurrentPlayer: true)
    }
}
