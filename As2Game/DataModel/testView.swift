//
////
////  LogInView.swift
////  As2Game
////
////  Created by Vũ Thị Hương on 13/08/2023.
////
//
//import Foundation
//
//import SwiftUI
//import CoreData
//import Combine
//
//struct testView: View {
//    @State private var selectedTabState: Tab = .explore
//    @State var isMusic : Bool = false
//    @State var isSFX : Bool = false
//    @State var isAutoPromotion : Bool = false
//    @State var isDifficult : String = "Easy"
//    @State var isDarkMode : Bool = false
//    @State var username : String = ""
//    @State var isBlurLogIn : Bool  = false
//    @State var showAddUserView : Bool = false
//    @State var userNameLogIn : String =  ""
//    @Environment(\.managedObjectContext) var managedObjContext
//    //    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchRequest<User>
//    @FetchRequest(sortDescriptors: [SortDescriptor(\User.username)]) var user: FetchedResults<User>
//    let fillPercentage: CGFloat = 1
//    @State var fullNameTerm : String =  ""
////    @AppStorage("username1") var username1: String = "Anonymous"
//    @State var username1 : String = ""
//    var username11 : [String] = ["alo","@twostraws", "123","345345"]
//    let word  = "IHFRR"
//    @State var i : Int = 0
//    private var timeRemaining = 100
//    private var timer = Timer.publish(every: 1, on: .main, in: .common)
//    private var cancellables = Set<AnyCancellable>()
//    var body: some View {
//        VStack{
//
//        }
//
//    }
//
//    func startClocks() {
//            timer
//                .autoconnect()
//                .map { _ in
//                    timeRemaining -= 1 // Decrement the binding variable
//                }
//                .sink { _ in
//                    if self.timeRemaining <= 0 {
//                        // Handle timer expiration here
//                        self.cancellables.forEach { $0.cancel() }
//                    }
//                }
//                .store(in: &cancellables)
//        }
//    func
//}
//struct testView_Previews: PreviewProvider {
//    static var previews: some View {
//        testView()
//    }
//}
//
//


import SwiftUI
import Combine

class CountdownTimer: ObservableObject {
    @Published var timeRemaining = 60
    private var cancellable: Cancellable?
    
    func start() {
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.cancellable?.cancel()
                }
            }
    }
    
    func reset() {
        timeRemaining = 60
        cancellable?.cancel()
    }
}

struct CountdownTimerView: View {
    @ObservedObject private var countdownTimer = CountdownTimer()
    
    var body: some View {
        VStack {
            Text("Countdown Timer")
                .font(.title)
            
            Text("\(countdownTimer.timeRemaining)")
                .font(.largeTitle)
                .foregroundColor(countdownTimer.timeRemaining <= 10 ? .red : .black)
                .padding()
            
            Button("Start Timer") {
                countdownTimer.start()
            }
            
            Button("Reset Timer") {
                countdownTimer.reset()
            }
        }
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView()
    }
}
