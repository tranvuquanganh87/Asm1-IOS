////
////  AddUserView.swift
////  As2Game
////
////  Created by Vũ Thị Hương on 11/08/2023.
////
//
//import Foundation
//import SwiftUI
//
////
////  ContentView.swift
////  As2Game
////
////  Created by Vũ Thị Hương on 10/08/2023.
////
//
//import SwiftUI
//
//struct AddUserView: View {
//    @Environment(\.managedObjectContext) var managedObjContext
//    @Environment(\.dismiss) var dismiss
//    
//    @State private var name = ""
//    @State private var password = ""
//    @State private var fullname = ""
//    var body: some View {
//        Form {
//            Section(header: Text("Personal Information")) {
//                TextField("Name", text: $name)
//                TextField("Pass", text: $password)
//            }
//            
//            Section {
//                Button("Save") {
//                    // Perform saving logic here
//                    DataController().addUser(fullname: fullname,username: name, password: password, context: managedObjContext)
//                    dismiss()
//                }
//            }
//        }
//    }
//}
//
//struct AddUserView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddUserView()
//    }
//}
