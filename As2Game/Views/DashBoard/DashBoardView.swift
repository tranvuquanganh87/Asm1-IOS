//
//  DashBoardView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 18/08/2023.
//

import Foundation


//
//  LogInView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 13/08/2023.
//

import Foundation

import SwiftUI
import CoreData

struct DashBoardView: View {
    @State private var selectedTabState: Tab = .explore
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
                Color("black-special").ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Image("sample_avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:50, height: 50)
                            .background(isDarkMode ? .black.opacity(0.2) : .white.opacity(0.2))
                            .mask(Circle())
                        Spacer()
                        Image(systemName: "x.circle")
                            .foregroundColor(.black)
                            .scaleEffect(2)
                            .onTapGesture {
                                isBlurLogIn.toggle()
                            }
                    }
                    .padding(.horizontal,15)
                    
                    Rectangle()
                        .foregroundColor(.yellow)
                        .cornerRadius(20)
                        .frame(height : 220)
                        .padding()
                        .overlay{
                            HStack{
                                VStack(alignment: .leading){
                                    VStack(alignment: .leading){
                                        Text("Let's become")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(Font.system(.title2, design: .monospaced))
                                        Text("a New")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(Font.system(.title2, design: .monospaced))
                                        Text("ChessMaster")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .font(Font.system(.title2, design: .monospaced))
                                    }
                                    
                                    Button(){
                                        //                            isBlurLogIn.toggle()
                                        
                                    } label: {
                                        Text("Finish")
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .font(Font.system(.headline, design: .monospaced))

                                    }
                                    .frame(maxWidth: 150, minHeight: 55)
                                    .background(Color.purple)
                                    .tint(.white)
                                    .clipShape(RoundedRectangle(cornerRadius:25))
                                    .shadow(color: .gray, radius: 3, x: 2, y: 5)
                                }
                                VStack(alignment: .trailing){
                                    Image("chess-background")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                .frame(width: 150,height: 100,alignment: .trailing)
                            }
                        }
                    HStack(spacing: 15){
                        VStack(spacing: 20){
                            Rectangle()
                                .foregroundColor(.purple)
                                .cornerRadius(20)
                                .frame(width: 180,height : 170)
                                .overlay{
                                    VStack(){
                                        VStack{
                                            Text("Play Vs AI")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(Font.system(.headline, design: .monospaced))
                                        }
                                        .frame(width:150, alignment: .leading)
                                        VStack(alignment: .trailing){
                                            Image("ai")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        .frame(width: 150,height: 100,alignment: .trailing)
                                    }
                                }
                            Rectangle()
                                .foregroundColor(Color("blue-special"))
                                .cornerRadius(20)
                                .frame(width: 180,height : 170)
                                .overlay{
                                    VStack{
                                        VStack{
                                            Text("Play Vs friend")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(Font.system(.headline, design: .monospaced))
                                        }
                                        .frame(width:150, alignment: .leading)
                                        VStack(alignment: .trailing){
                                            Image("man")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        .frame(width: 150,height: 100,alignment: .trailing)
                                    }
                                }
                        }
                        VStack(spacing: 27){
                            Button(){
                                
                            } label: {
                                HStack(spacing:10){
                                    Image("medal")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 70)
                                    Text("Score")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(Font.system(.headline, design: .monospaced))
                                }
                            }
                            .frame(maxWidth: 170, minHeight: 65)
                            .background(Color.yellow)
                            .tint(.white)
                            .clipShape(RoundedRectangle(cornerRadius:25))
                            .shadow(color: .gray, radius: 3, x: 2, y: 5)
                            
                            Rectangle()
                                .foregroundColor(Color("blue-special"))
                                .cornerRadius(20)
                                .frame(width: 170,height : 170)
                                .overlay{
                                    VStack{
                                        VStack{
                                            Text("How to play")
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                                .font(Font.system(.headline, design: .monospaced))
                                        }
                                        .frame(width:150, alignment: .leading)
                                        VStack(alignment: .trailing){
                                            Image("guide")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                        .frame(width: 150,height: 100,alignment: .trailing)
                                    }
                                }
                            Button(){
                                
                            } label: {
                                Text("Play")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(Font.system(.headline, design: .monospaced))
                            }
                            .frame(maxWidth: 170, minHeight: 65)
                            .background(Color.purple)
                            .tint(.white)
                            .clipShape(RoundedRectangle(cornerRadius:25))
                            .shadow(color: .gray, radius: 3, x: 2, y: 5)
                        }
                    }
                    .padding(.horizontal,17)
                    VStack{
                        CustomFooterView(selectedTab: $selectedTabState)
                    }
                    .frame(width:400)
                    
                }
                
                
            }
        }
    }
}
struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}


