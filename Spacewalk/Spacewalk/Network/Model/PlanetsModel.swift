//
//  PlanetsModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-09.
//

import Foundation

struct PlanetsModel: Codable {
    var name: String?
    var mass: String?
    var distanceFromStar: String?
    var orbitalPeriod: String?
    var temperature: String?
    var description: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, description, mass, distanceFromStar, orbitalPeriod, temperature
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        mass = try container.decodeIfPresent(String.self, forKey: .mass)
        distanceFromStar = try container.decodeIfPresent(String.self, forKey: .distanceFromStar)
        orbitalPeriod = try container.decodeIfPresent(String.self, forKey: .orbitalPeriod)
        temperature = try container.decodeIfPresent(String.self, forKey: .temperature)
    }
}


