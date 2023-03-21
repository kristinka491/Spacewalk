//
//  StarSystemsModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-09.
//

import Foundation

struct SolarSystem: Decodable {
    var description: String?
    var mainStar: String?
    var mainStarDescription: String?
    var planets: [PlanetsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case description, mainStar, mainStarDescription, planets
    }
}
