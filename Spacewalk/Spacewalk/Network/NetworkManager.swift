//
//  NetworkManager.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-04-13.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func loadData() async -> SolarSystem? {
        let urlString = "http://127.0.0.1:5000/solarSystem"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(SolarSystem.self, from: data) {
                return decodedResponse
            }
        } catch {
            print("Invalid data")
        }
        return nil
    }
}
