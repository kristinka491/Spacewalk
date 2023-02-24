//
//  LoginViewModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import Foundation

import Foundation
import RealmSwift
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    @Published var isShowError = false
    @Published var isRegistered = false
    
    private let realmDataStore = RealmDataStore.shared
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        Publishers.CombineLatest($username, $password).map { username, password in
            return !username.isEmpty && !password.isEmpty
        }
        .receive(on: DispatchQueue.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
    
    func getUser() {
        let user = realmDataStore.getUser(login: username, password: password)
        if user == nil {
            isShowError = true
        } else {
            isRegistered = true
        }
    }
}
