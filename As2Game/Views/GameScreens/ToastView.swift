//
//  ToastView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 20/08/2023.
//

import Foundation

//
//  ToastView.swift
//  Wordle
//
//  Created by Silvia España on 2/3/22.
//

import SwiftUI

struct ToastView: View {
    
    let toastText: String
    
    var body: some View {
        if toastText != "" {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primary))
        } else {
            Spacer()
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastText: "text")
    }
}
