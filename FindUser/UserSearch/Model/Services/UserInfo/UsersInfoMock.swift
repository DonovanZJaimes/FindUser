//
//  UsersInfoMock.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

// UsersInfoMock implementation, which depends on the JsonParserProtocol
class UsersInfoMock: UsersInfoProtocol {
    private let jsonParser: JsonParserProtocol
    
    init(jsonParser: JsonParserProtocol) {
        self.jsonParser = jsonParser
    }
    
    func getUsers() async throws -> UsersInformation {
        guard let model = jsonParser.parseJson(jsonName: "UsersInfo", model: UsersInformation.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
}

