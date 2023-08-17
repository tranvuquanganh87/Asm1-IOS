//
//  Position+UIKit.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation
import UIKit

extension Position {
    var size: CGSize {
        CGSize(width: CGFloat(x) * UIScreen.main.bounds.width / 8, height: -CGFloat(y) * UIScreen.main.bounds.width / 8)
    }

    init(_ translation: CGSize) {
        x = Int((translation.width / (UIScreen.main.bounds.width / 8)).rounded())
        y = Int((translation.height / (UIScreen.main.bounds.width / 8)).rounded())
    }
}
