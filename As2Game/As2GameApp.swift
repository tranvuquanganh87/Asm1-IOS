//
//  As2GameApp.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 10/08/2023.
//

import SwiftUI

@main
struct As2GameApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext )
        }
    }
}
