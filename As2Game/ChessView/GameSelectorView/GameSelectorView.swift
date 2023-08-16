//
//  GameSelectorView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 15/08/2023.
//

import Foundation

struct GameSelectorView: View {

    private let viewModel = GameSelectorViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                PersonView(systemName: "person")
                .padding(.leading)
                HStack {
                    ForEach(viewModel.computerGameModes) {
                        GameModeView(gameMode: $0)
                    }
                }
                PersonView(systemName: "person.2")
                .padding(.leading)
                .padding(.top, 32)
                HStack {
                    ForEach(viewModel.localFriendModes) {
                        GameModeView(gameMode: $0)
                    }
                }
                Spacer()

            }
            .padding(.top, 32)
            .navigationBarTitle("Chess")
        }.accentColor(.primary)

    }
}

struct GameSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectorView()
    }
}
