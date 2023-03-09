//
//  StarSystemsModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-09.
//

import Foundation

struct StarSystemsModel: Codable {
    var name: String?
    var description: String?
    var planets: [PlanetsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case name, description, planets
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        planets = try container.decodeIfPresent([PlanetsModel].self, forKey: .planets)
    }
}
