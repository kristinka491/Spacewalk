//
//  PlanetModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation

struct SystemsModel: Codable {
    var starSystems: [StarSystemsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case starSystems
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        starSystems = try container.decodeIfPresent([StarSystemsModel].self, forKey: .starSystems)
    }
}
