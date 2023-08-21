//
//  Color+Extension.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 20/08/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static var wrong: Color {
        Color(UIColor(named: "wrong")!)
    }
    
    static var misplaced: Color {
        Color(UIColor(named: "misplaced")!)
    }
    
    static var correct: Color {
        Color(UIColor(named: "correct")!)
    }
    
    static var unused: Color {
        Color(UIColor(named: "unused")!)
    }
    
    static var systemBackground: Color {
        Color(.systemBackground)
    }
}
