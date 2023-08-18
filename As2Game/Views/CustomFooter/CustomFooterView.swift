//
//  CustomFooterView.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 18/08/2023.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable{
    case explore
    case profile
    
}

struct CustomFooterView : View {
    @Binding var selectedTab : Tab
    private var fillImg: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body : some View{
        VStack{
            Spacer()
            HStack{
                ForEach(Tab.allCases, id:\.rawValue){ tab in
                    Spacer()
                    if (tab == .explore){
                        Image(systemName: selectedTab == tab ?  "house.fill" : "house")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? Color("blue-special") : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    else if (tab == .profile){
                        Image(systemName: selectedTab == tab ?  "person.fill" : "person")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? Color("blue-special") : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width:150,height: 60)
            .background(Color("gray-special"))
            .cornerRadius(20)
            .padding(10)
            .padding(.bottom, 20)
            
        }
    }
}

//struct CustomFooterView_Previews : PreviewProvider{
////    @State private var selectedTabState: Tab = .explore
//    static var previews: some View{
//        CustomFooterView(selectedTab: $selectedTabState)
//    }
//}
