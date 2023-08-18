//
//  HudView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 16/08/2023.
//

import Foundation

import SwiftUI


struct HUDView: View {
    
    let name: String
    let time: String
    let isCurrentPlayer: Bool
    @State private var isRotating: Bool = false
    
    var body: some View {
        HStack {
            HStack{
                Image("sample_avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height: 50)
                    .background(.black.opacity(0.2) )
                    .mask(Circle())
                VStack{
                    Text(name)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    
                    Text("level 2")
                }
            }
            
            Spacer()
            Rectangle()
                .foregroundColor(isCurrentPlayer ? .yellow : .gray)
                .cornerRadius(20)
                .frame(width:140,height : 50)
                .padding()
                .overlay{
                    HStack {
                        Image(systemName: "clock")
                        Text(time)
                    }
                    
                    .padding()
                }
               
           
//            .background(Color.green.opacity(0.7))
            
        }
        .padding(.horizontal,10)
        .foregroundColor(.white)
        .font(Font.system(.headline, design: .monospaced))
//        .background(Color.secondary)
        .opacity(isCurrentPlayer ? 1 : 0.7)
        .blur(radius: isCurrentPlayer ? 0 : 0.4)
        
    }
}

struct HudView_Previews: PreviewProvider {
    static var previews: some View {
        HUDView(name: "Iván Ruiz", time: "04:03.15", isCurrentPlayer: true)
    }
}
