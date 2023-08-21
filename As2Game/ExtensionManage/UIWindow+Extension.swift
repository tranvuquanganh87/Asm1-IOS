//
//  UIWindow+Extension.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 20/08/2023.
//

import Foundation
import UIKit

extension UIWindow {
    
    static var key: UIWindow? {
        
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
                let window = windowSceneDelegate.window else {
                    return nil
                }
        return window
    }
}
