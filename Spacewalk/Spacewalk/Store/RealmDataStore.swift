//
//  RealmDataStore.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import Foundation
import RealmSwift

class RealmDataStore {
    
    static let shared = RealmDataStore()
    private let realm = try? Realm()
    
    func addUser(name: String,
                 login: String,
                 password: String) -> Bool {
        if !isUserRegistered(with: login) {
            let user = User()
            user.name = name
            user.login = login
            user.password = password
            saveObject(user: user)

            return true
        }
        return false
    }
    
    func getUser(login: String, password: String) -> User? {
        if let user = getUser(with: login),
           user.password == password {
            return user
        }
        return nil
    }
    
    func getUser(with login: String) -> User? {
        let user = realm?.object(ofType: User.self,
                                 forPrimaryKey: login)
        return user
    }

    func isUserRegistered(with login: String) -> Bool {
        return getUser(with: login) != nil
    }
    
    private func saveObject(user: User) {
        try? realm?.write {
            realm?.add(user)
        }
        print("Data Was Saved To Realm Database.")
    }
}
