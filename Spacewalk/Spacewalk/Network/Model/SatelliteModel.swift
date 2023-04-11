//
//  SatelliteModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-04-11.
//

import Foundation

struct SatelliteModel: Decodable {
    var name: String?
    var description: String?
    var age: String?
    var orbitalPeriod: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, description, age, orbitalPeriod
    }
}
