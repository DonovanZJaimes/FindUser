//
//  UserSearchViewModel.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

@MainActor

class UserSearchViewModel: ObservableObject {
    @Published var userSearched = ""  // What the user writes in the TextField
    @Published var usersInfo: [UserInfo] = []  // List of filtered users
    @Published var hasSearched = false // Indicator of whether a search has been performed
    @Published var isLoading = false  // Load indicator (to display the ProgressView)
    
    var allUsers: [UserInfo] = []  // All users, unfiltered
    private let usersInfoMock = UsersInfoMock(jsonParser: UtilsJson())
    
    
    // Function to load users
    func loadUsers() async {
        // We only load users if they have not been loaded before.
        if allUsers.isEmpty {
            do {
                let users = try await usersInfoMock.getUsers()
                self.allUsers = users
            } catch {
                print("Error al cargar usuarios: \(error)")
            }
        }
    }
  
    // Function to filter users
    func filterUsers() {
        hasSearched = true  // The search was performed
        isLoading = true  // We start loading, we show the ProgressView
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.userSearched.isEmpty {
                self.usersInfo = []  // Do not display anything if the field is empty
            } else {
                self.usersInfo = self.allUsers.filter { user in
                    user.name.lowercased().contains(self.userSearched.lowercased())
                }
            }
            self.isLoading = false  // After 1 second, we finish loading
        }
        
    }
    
}
