//
//  LResponse.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation

struct LResponse<T: Decodable> {
    var object: T?
    var data: Any?
    var error: NSError?
}

