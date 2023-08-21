//
//  DataController.swift
//  As2Game
//
//  Created by Vũ Thị Hương on 11/08/2023.
//

import Foundation
import CoreData

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "UserModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("fail to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!!")
        } catch {
            print("We could not save the data")
        }
    }
    
    func addUser(fullname : String, username : String, password : String, context: NSManagedObjectContext){
        let user = User(context : context)
        user.id = UUID()
        user.username = username
        user.password = password
        user.fullname = fullname
        user.score = 10
        save(context: context)
        
    }
    
    func editUser(user : User, username : String , password : String , context : NSManagedObjectContext){
        user.username = username
        user.password = password
        user.score = 10
        save(context: context)
    }
}
