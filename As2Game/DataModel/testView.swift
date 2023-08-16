
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
    @State var username : String = ""
    @State var isBlurLogIn : Bool  = false
    @State var showAddUserView : Bool = false
    @Environment(\.managedObjectContext) var managedObjContext
    //    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchRequest<User>
    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchedResults<User>
    let fillPercentage: CGFloat = 0.6
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
                        VStack(spacing: 20){
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
                                VStack(spacing: 20){
                                    VStack(alignment: .leading,spacing: 5){
                                        Text("Create a profile")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                        Text("Fill in your account information")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    VStack(spacing: 40){
                                        ZStack{
                                            TextField("Enter text", text: $fullNameTerm)
                                                .padding()
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.gray, lineWidth: 2) // Set the border color and width
                                                )
                                            VStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.white)
                                                    .frame(width: 100, height:10)
                                                    .overlay(
                                                        Text("Full name")
                                                            .foregroundColor(.black) // Set the text color
                                                    )
                                            }
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .offset(x:20,y:-28)
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        
                                        ZStack{
                                            TextField("Enter text", text: $fullNameTerm)
                                                .padding()
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.gray, lineWidth: 2) // Set the border color and width
                                                )
                                            VStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.white)
                                                    .frame(width: 100, height:10)
                                                    .overlay(
                                                        Text("User Name")
                                                            .foregroundColor(.black) // Set the text color
                                                    )
                                            }
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .offset(x:20,y:-28)
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        
                                        ZStack{
                                            TextField("Enter text", text: $fullNameTerm)
                                                .padding()
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.gray, lineWidth: 2) // Set the border color and width
                                                )
                                            VStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.white)
                                                    .frame(width: 100, height:10)
                                                    .overlay(
                                                        Text("Password")
                                                            .foregroundColor(.black) // Set the text color
                                                    )
                                            }
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .offset(x:20,y:-28)
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        
                                        ZStack{
                                            TextField("Enter text", text: $fullNameTerm)
                                                .padding()
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.gray, lineWidth: 2) // Set the border color and width
                                                )
                                            VStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundColor(.white)
                                                    .frame(width: 170, height:10)
                                                    .overlay(
                                                        Text("Confirm Password")
                                                            .foregroundColor(.black) // Set the text color
                                                    )
                                            }
                                            .frame(maxWidth: .infinity, alignment: .topLeading)
                                            .offset(x:20,y:-28)
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    }
                                    
                                }
                                Button(){
                                    //                            isBlurLogIn.toggle()
                                    
                                } label: {
                                    Text("Continue")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: size.width, minHeight: 65)
                                .background(Color.black)
                                .tint(.white)
                                .clipShape(RoundedRectangle(cornerRadius:30))
                                .padding()
                                
                                HStack{
                                    Text("Already have an Account?")
                                    Text("LogIn")
                                        .underline()
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                                Rectangle()
                                    .frame(height: 2)
                                    .opacity(0.1)
                                    .background(.black)
                                    .padding(18)
                                HStack(spacing: 30){
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color.white)
                                        .overlay{
                                            Image("facebook")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    
                                    Rectangle()
                                        .frame(width: 45, height: 45)
                                        .foregroundColor(Color.white)
                                        .overlay{
                                            Image("twitter-sign")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
                                    
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(Color.white)
                                        .overlay{
                                            Image("letter-g")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }

                                }
                                .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
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
