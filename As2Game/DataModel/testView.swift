
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
            VStack{
            }
        }
    }
}
struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}


