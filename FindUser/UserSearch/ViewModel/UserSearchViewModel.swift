//
//  UserSearchViewModel.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

class UserSearchViewModel: ObservableObject {
    @Published var usersInfo: [UserInfo] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var userSearched: String = ""
    
    func getUsersInfo() async throws -> [UserInfo] {
        isLoading = true
        errorMessage = nil
        let utilsJson = UtilsJson()
        let usersInfoMock = UsersInfoMock(jsonParser: utilsJson)
        do {
            let users = try await usersInfoMock.getUsers()
            isLoading = false
            return users
        }
        catch {
            print(error.localizedDescription)
            self.errorMessage = "No se pudo obtener la información de los usuarios"
            isLoading = false
            return []
        }
        
        
    }
    
}
