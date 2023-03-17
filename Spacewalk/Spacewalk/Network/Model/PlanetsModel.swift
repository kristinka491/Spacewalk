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
}


