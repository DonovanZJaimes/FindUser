//
//  UsersInfo.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

typealias UsersInformation = [UserInfo]

struct UserInfo: Codable, Identifiable {
    var id = UUID()
    let name: String
    let email: String
    let address: String
    let phone: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case email = "correo_electronico"
        case address = "direccion"
        case phone = "telefono"
    }
}
