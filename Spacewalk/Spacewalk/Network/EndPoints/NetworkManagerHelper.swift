//
//  NetworkManagerHelper.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-03-08.
//

import Foundation
import Moya

extension NetworkManager {

    func planets(typeOfWine: TypeOfWineEnum ,completion: (([WineModel]?, Error?) -> Void)?) {
        let winesRequest = TypesOfWine.wine(type: typeOfWine)
        doRequest(target: MultiTarget(winesRequest), completion: completion)
    }
}
