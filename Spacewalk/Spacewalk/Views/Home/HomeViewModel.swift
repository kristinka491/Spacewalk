//
//  HomeViewModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var solarSystem = SolarSystem()
    
    func loadData() async {
        guard let url = URL(string: "http://127.0.0.1:5000/solarSystem") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(SolarSystem.self, from: data) {
                solarSystem = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}
