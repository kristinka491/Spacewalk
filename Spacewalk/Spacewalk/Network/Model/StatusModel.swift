//
//  StatusModel.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation


struct StatusModel: Codable {
    var status: String?

    private enum CodingKeys: String, CodingKey {
        case status
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decodeIfPresent(String.self, forKey: .status)
    }
}
