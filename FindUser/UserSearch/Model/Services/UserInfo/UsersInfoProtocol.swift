//
//  UsersInfoProtocol.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

// Protocol for obtaining users
protocol UsersInfoProtocol {
    func getUsers() async throws -> UsersInformation
}




