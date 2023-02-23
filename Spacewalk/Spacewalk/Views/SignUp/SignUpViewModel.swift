//
//  SignUpViewModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import Foundation
import RealmSwift
import Combine

class SignUpViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    
    private let realmDataStore = RealmDataStore.shared
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        Publishers.CombineLatest3($username, $name, $password).map { username, name, password in
            return !username.isEmpty && !name.isEmpty && !password.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
    
    func saveUser() {
        realmDataStore.addUser(name: name, login: username, password: password)
    }
}
