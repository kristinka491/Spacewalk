//
//  HomeViewModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var solarSystem = SolarSystem()
    
    private let networkManager = NetworkManager.shared
    
    func loadData() async {
        Task { @MainActor in
            solarSystem = await networkManager.loadData() ?? SolarSystem()
        }
    }
}
