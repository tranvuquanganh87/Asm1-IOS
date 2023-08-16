//
//  ContentView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 10/08/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var username : String = ""
    @State var isBlurLogIn : Bool  = false
    @State var showAddUserView : Bool = false
    @State var isLogIn : Bool  = false
    var body: some View {
        GeometryReader{
            let size = $0.size
            if (isLogIn){
                LogInView()
            }
            else{
                ZStack{
                    Image("chess-welcome")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .position(x: size.width / 2 - 38, y: size.height / 2)
                    
                    Spacer()
                    //                if (isBlurLogIn){
                    //                    VStack{
                    //                        Image(systemName: "x.circle")
                    //                            .foregroundColor(.white)
                    //                            .onTapGesture {
                    //                                isBlurLogIn.toggle()
                    //                            }
                    //                        HStack {
                    //                            Image(systemName: "magnifyingglass")
                    //                                .foregroundColor(.gray)
                    //                            TextField("Search", text: $username)
                    //                                .foregroundColor(.black)
                    //
                    //                            Button(action: {
                    //                                username = " "
                    //                                withAnimation(.spring()) {
                    //
                    //                                }
                    //                            }) {
                    //                                Image(systemName: "xmark.circle.fill")
                    //                                    .foregroundColor(.gray)
                    //                            }
                    //                            Spacer()
                    //
                    //                            Button(){
                    //                            } label: {
                    //                                Text("Play")
                    //                                    .fontWeight(.bold)
                    //                                    .foregroundColor(.black)
                    //                            }
                    //                            .frame(minWidth: 90, minHeight: 40)
                    //                            .background(Color.white)
                    //                            .tint(.white)
                    //                            .clipShape(RoundedRectangle(cornerRadius:18))
                    //
                    //                        }
                    //                        .frame(width: size.width - 50, height: 25)
                    //                        .padding(8)
                    //                        .background(Color.gray.opacity(0.2))
                    //                        .cornerRadius(18)
                    //                        .padding()
                    //                    }
                    //                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    //                }
                    //                else  {
                    
                    if (isBlurLogIn == false){
                        VStack(spacing: 50){
                            VStack(alignment: .leading,spacing: 10){
                                Text("Chess Online")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text("Unlock the Power of Strategy in the Ultimate Game of Chess")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                            }
                            .padding(.horizontal,10)
                            .frame(maxWidth: .infinity)
                            
                            Button(){
                                isBlurLogIn.toggle()
                            } label: {
                                Text("Let's play")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: size.width, minHeight: 65)
                            .background(Color.white)
                            .tint(.white)
                            .clipShape(RoundedRectangle(cornerRadius:30))
                            .padding(.horizontal,20)
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom,60)
                    }
                    else{
                        VStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 14) {
                                HStack{
                                    VStack(alignment: .leading, spacing:0){
                                        Text("Glad to")
                                            .font(.title)
                                            .bold()
                                        Text("Meet you!")
                                            .bold()
                                            .font(.largeTitle)
                                    }
                                    
                                    Spacer()
                                    Image(systemName: "x.circle")
                                        .foregroundColor(.black)
                                        .scaleEffect(2)
                                        .onTapGesture {
                                            isBlurLogIn.toggle()
                                        }
                                }
                                .padding(.horizontal,20)
                                Button(){
                                    //                            isBlurLogIn.toggle()
                                    isLogIn.toggle()
                                } label: {
                                    Text("Log In")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: size.width, minHeight: 65)
                                .background(Color.black)
                                .tint(.white)
                                .clipShape(RoundedRectangle(cornerRadius:30))
                                .padding()
                                HStack(spacing: 20){
                                    Text("OR")
                                    Rectangle()
                                        .frame(height: 2)
                                        .opacity(0.1)
                                        .background(.black)
                                        .padding(.trailing,20)
                                }
                                .padding(.horizontal,20)
                                
                                Button(){
                                    //                            isBlurLogIn.toggle()
                                   
                                    
                                } label: {
                                    Text("Sign up")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: size.width, minHeight: 65)
                                .background(Color.black)
                                .tint(.white)
                                .clipShape(RoundedRectangle(cornerRadius:30))
                                .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.bottom, 20)
                            .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                            .background(.white)
                            .cornerRadius(20, corners: [.topLeft, .topRight])
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





