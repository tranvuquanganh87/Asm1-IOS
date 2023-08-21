//
//  ColorSchemeManager.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 20/08/2023.
//

import Foundation
import SwiftUI

enum ColorScheme: Int {
    
    case unspecified, light, dark
}

class ColorSchemeManager: ObservableObject {
    
    @AppStorage("colorScheme") var colorScheme: ColorScheme = .unspecified {
        
        didSet {
            applyColorScheme()
        }
    }
    
    func applyColorScheme() {
        
        UIWindow.key?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: colorScheme.rawValue)!
    }
}
