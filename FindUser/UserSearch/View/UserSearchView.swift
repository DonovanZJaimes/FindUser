//
//  UserSearchView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct UserSearchView: View {
    @StateObject private var userSearchViewModel = UserSearchViewModel()
    
    var body: some View {
        VStack {
            contentView
        }
        .background(Color.background)
        .padding()
    }
    
    // View to display the data
    private var contentView: some View {
        VStack(spacing: 20) {
            SearchView(userSearchViewModel: userSearchViewModel)
                .padding(.horizontal, 20)
            
            // Show the ProgressView when the search is in progress
            if userSearchViewModel.isLoading {
                ProgressView("Buscando...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                // Display the corresponding message according to the search status
                if userSearchViewModel.userSearched.isEmpty && !userSearchViewModel.hasSearched {
                    noSearchMessage
                } else if userSearchViewModel.hasSearched && userSearchViewModel.usersInfo.isEmpty {
                    noUsersFoundMessage
                } else {
                    usersList
                }
            }
            
            Spacer()
        }
    }
    
    // View for the message when no search has been performed
    private var noSearchMessage: some View {
        Text("Por favor, ingrese un nombre para buscar.")
            .font(.body)
            .foregroundColor(.gray)
            .padding()
    }
    
    // View for the message when no users are found
    private var noUsersFoundMessage: some View {
        VStack {
            Image("NoUsers")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
        }
        .padding()
    }
    
    // View for the list of users
    private var usersList: some View {
        ListView(users: $userSearchViewModel.usersInfo)
    }
}



#Preview {
    UserSearchView()
}
