//
//  LogInView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 13/08/2023.
//

import Foundation

import SwiftUI
import CoreData
import UIKit
struct LogInView: View {
    
    @State var isLogIn : Bool  = false
    @State var isAvatarInfo : Bool = false
    @State var isUserInfo : Bool = false
    @State var username : String = ""
    let fillPercentage2: CGFloat = 0.6
    @State var isBlurLogIn : Bool  = false
    @State var showAddUserView : Bool = false
    @Environment(\.managedObjectContext) var managedObjContext
    @State var fullNameTerm : String =  ""
    @State var isWelComeView : Bool = true
    //    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchRequest<User>
    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchedResults<User>
    let fillPercentage1: CGFloat = 0.3
    var body: some View {
        ZStack{
            
            if (isWelComeView || !isLogIn){
                welcomeScreen()
            }
            if (isAvatarInfo){
                avatarInfo()
            }
            if (isUserInfo){
                accountInfo()
            }
            
        }
    }
    
    @ViewBuilder
    func welcomeScreen() -> some View{
        GeometryReader{
            let size = $0.size
            if (isLogIn){
                avatarInfo()
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
                                    isWelComeView = false
                                    isAvatarInfo = true
                                    print(isWelComeView)
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
    @ViewBuilder
    func avatarInfo()-> some View{
        GeometryReader{
            let size = $0.size
            ZStack{
                Image("chess-welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .position(x: size.width / 2 - 38, y: size.height / 2)
                VStack {
                    Spacer()
                    VStack(spacing: 15){
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
                                            .frame(width: (size.width - 30) * fillPercentage1)
                                    }
                                    .frame(width: size.width - 30,alignment: .leading)
                                }
                            VStack(alignment: .leading,spacing: 5){
                                Text("Create a profile")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Text("Choose your avatar")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Image("sample_avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        VStack(spacing : 20){
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("Show All")
                                        .underline()
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue)
                                }
                                
                                ScrollView(.horizontal){
                                    LazyHStack{
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                        Image("sample_avatar")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(10)
                                    }
                                    .cornerRadius(10)
                                    
                                }
                                .frame(height: 100)
                            }
                            
                            HStack{
                                Rectangle()
                                    .frame(height: 2)
                                    .opacity(0.1)
                                    .background(.black)
                                    .padding(.leading,20)
                                Text("OR")
                                Rectangle()
                                    .frame(height: 2)
                                    .opacity(0.1)
                                    .background(.black)
                                    .padding(.trailing,20)
                            }
                            VStack(spacing: 1){
                                Text("Upload your own image")
                                    .font(.headline)
                                Button(){
                                    
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: size.width, minHeight: 60)
                                .background(Color.black)
                                .tint(.white)
                                .clipShape(Circle())
                                .padding()
                            }
                            HStack(){
                                Spacer()
                                Text("Back")
                                    .padding(.horizontal,50)
                                    .onTapGesture {
                                        isWelComeView = true
                                        isLogIn = false
                                        print(isLogIn)
                                        print(isWelComeView)
                                        
                                    }
                                Button(){
                                    //                            isBlurLogIn.toggle()
                                    isUserInfo = true
                                    print(isUserInfo)
                                    print(isWelComeView)
                                } label: {
                                    Text("Continue")
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
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                //                VStack{
                //                    Text("alo")
                //                    List{
                //                        ForEach(user,id: \.id){ user in
                //                            VStack{
                //                                //                        Text("user\(count)")
                //                                Text(user.username!)
                //                                Text(user.password!)
                //                            }
                //                        }
                //                    }
                //                    Button{
                //                        showAddUserView.toggle()
                //                    } label: {
                //                        Label("Add Food", systemImage: "plus.circle")
                //                    }
                //                    if (showAddUserView){
                //                        AddUserView()
                //                    }
                //                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    @ViewBuilder
    func accountInfo() -> some View {
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
                                                .frame(width: (size.width - 30) * fillPercentage2)
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
                                HStack(){
                                    Spacer()
                                    Text("Back")
                                        .padding(.horizontal,50)
                                        .onTapGesture {
                                            isAvatarInfo = true
                                            isUserInfo = false
                                        }
                                    Button(){
                                        //                            isBlurLogIn.toggle()
                                        
                                    } label: {
                                        Text("Continue")
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
