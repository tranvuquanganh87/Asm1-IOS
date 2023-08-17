
//
//  LogInView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 13/08/2023.
//

import Foundation

import SwiftUI
import CoreData

struct testView: View {
    @State var isMusic : Bool = false
    @State var isSFX : Bool = false
    @State var isAutoPromotion : Bool = false
    @State var isDifficult : String = "Easy"
    @State var isDarkMode : Bool = false
    @State var username : String = ""
    @State var isBlurLogIn : Bool  = false
    @State var showAddUserView : Bool = false
    @Environment(\.managedObjectContext) var managedObjContext
    //    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchRequest<User>
    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchedResults<User>
    let fillPercentage: CGFloat = 1
    @State var fullNameTerm : String =  ""
    var body: some View {
        GeometryReader{
            let size = $0.size
            ZStack{
                ZStack{
                    Image("chess-welcome")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .position(x: size.width / 2 - 38, y: size.height / 2)
                    VStack {
                        Spacer()
                        VStack(spacing: 70){
                            VStack(alignment: .leading){
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: size.width - 30, height: 10)
                                    .cornerRadius(10)
                                    .overlay{
                                        VStack{
                                            Rectangle()
                                                .foregroundColor(.black)
                                                .cornerRadius(10)
                                                .frame(width: (size.width - 30) * fillPercentage)
                                        }
                                        .frame(width: size.width - 30,alignment: .leading)
                                    }
                                VStack(alignment: .leading,spacing: 5){
                                    Text("Create a profile")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    Text("Finish your profile setting")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(spacing:40){
                                HStack{
                                    Text("Theme preference")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 18){
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isDarkMode ? .white : .black))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Image(systemName: "sun.max.fill")
                                                        .foregroundColor(isDarkMode ? .black : .white)
                                                    Text("Light ")
                                                        .foregroundColor(isDarkMode ? .black : .white)
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                isDarkMode = false
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isDarkMode ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Image(systemName: "moon.fill")
                                                        .foregroundColor(isDarkMode ? .white : .black)
                                                    Text("Dark")
                                                        .foregroundColor(isDarkMode ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isDarkMode = true
                                            }
                                    }
                                }
                                
                                HStack{
                                    Text("Difficulty")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 18){
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isDifficult == "Easy" ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Easy")
                                                        .foregroundColor(isDifficult == "Easy" ? .white : .black)
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                isDifficult = "Easy"
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isDifficult == "Medium" ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Medium")
                                                        .foregroundColor(isDifficult == "Medium" ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isDifficult = "Medium"
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isDifficult == "Hard" ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Hard")
                                                        .foregroundColor(isDifficult == "Hard" ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isDifficult = "Hard"
                                            }
                                    }
                                }
                                
                                HStack{
                                    Text("Music")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 18){
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isMusic ? .white : .black))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Light ")
                                                        .foregroundColor(isMusic ? .black : .white)
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                isMusic = false
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isMusic ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Dark")
                                                        .foregroundColor(isMusic ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isMusic = true
                                            }
                                    }
                                }
                                
                                HStack{
                                    Text("SFX")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 18){
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isSFX ? .white : .black))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Light ")
                                                        .foregroundColor(isSFX ? .black : .white)
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                isSFX = false
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isSFX ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Dark")
                                                        .foregroundColor(isSFX ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isSFX = true
                                            }
                                    }
                                }
                                
                                HStack{
                                    Text("Auto Promotion")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    HStack(spacing: 18){
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isAutoPromotion ? .white : .black))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Disnable")
                                                        .foregroundColor(isAutoPromotion ? .black : .white)
                                                }
                                                
                                            }
                                            .onTapGesture {
                                                isAutoPromotion = false
                                            }
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(isAutoPromotion ? .black : .white))
                                            .frame(width: 80, height: 40)
                                            .overlay{
                                                HStack(spacing: 3){
                                                    Text("Enable")
                                                        .foregroundColor(isAutoPromotion ? .white : .black)
                                                }
                                            }
                                            .onTapGesture {
                                                isAutoPromotion = true
                                            }
                                    }
                                }
                            }
                            
                            HStack(){
                                Spacer()
                                Text("Back")
                                    .padding(.horizontal,50)
                                    .onTapGesture {
                                        
                                    }
                                Button(){
                                    //                            isBlurLogIn.toggle()
                                    
                                } label: {
                                    Text("Finish")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: 200, minHeight: 65)
                                .background(Color.black)
                                .tint(.white)
                                .clipShape(RoundedRectangle(cornerRadius:30))
                                .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .frame(maxWidth: .infinity)
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
struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
