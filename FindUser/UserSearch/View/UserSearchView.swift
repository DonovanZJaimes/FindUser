//
//  UserSearchView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct UserSearchView: View {
    @State private var  users = [UserInfo]()
    @StateObject private var userSearchViewModel = UserSearchViewModel()
    
   
    var body: some View {
        VStack {
            if let errorMessage = userSearchViewModel.errorMessage {
                Text(errorMessage).foregroundStyle(.red)
            }
            if userSearchViewModel.isLoading {
                ProgressView("Loading user data...")
            } else {
                Text("Cantidad de usuarios: \(users.count)")
                Text("\(users)")
            }
            
            
        }
        .onAppear{
            Task {
                users = try await userSearchViewModel.getUsersInfo()
            }
        }
    }
}

#Preview {
    UserSearchView()
}
