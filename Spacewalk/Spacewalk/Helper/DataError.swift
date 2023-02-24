//
//  DataError.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-02-24.
//

import Foundation

enum DataError {
    case wrongUsernameOrPassword
//    case theSamePassword
    case userIsRegistered

    var title: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordTitle
//        case .theSamePassword:
//            return StringConstants.theSamePasswordTitle
        case .userIsRegistered:
            return StringConstants.userIsRegisteredTitle
        }
    }

    var message: String {
        switch self {
        case .wrongUsernameOrPassword:
            return StringConstants.wrongUsernameOrPasswordMessage
//        case .theSamePassword:
//            return StringConstants.theSamePasswordMessage
        case .userIsRegistered:
            return StringConstants.userIsRegisteredMessage
        }
    }
}
