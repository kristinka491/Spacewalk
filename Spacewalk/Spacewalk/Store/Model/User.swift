//
//  User.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-23.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var login = ""
    @Persisted var name = ""
    @Persisted var password = ""
}
