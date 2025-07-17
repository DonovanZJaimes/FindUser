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
            // Error handling
            if let errorMessage = userSearchViewModel.errorMessage {
                errorView(message: errorMessage)
            }
            
            // Charging indicator
            if userSearchViewModel.isLoading {
                loadingView()
            } else {
                contentView
            }
            
            
        }
        .onAppear{
            loadData()
        }
        .background(Color.white)
    }
    
    // Function to load data when necessary
    private func loadData() {
           Task {
               do {
                   users = try await userSearchViewModel.getUsersInfo()
               } catch {
                   userSearchViewModel.errorMessage = "Error al cargar los datos"
               }
           }
       }
    
    // View to display the data
    private var contentView: some View {
            VStack(spacing: 20) {
                SearchView(userSearchViewModel: userSearchViewModel)
                    .padding(.horizontal, 20)
                ListView(users: $users)
            }
        }
    
    // View to display an error
    private func errorView(message: String) -> some View {
            Text(message)
                .foregroundColor(.red)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.yellow.opacity(0.2)))
                .padding(.horizontal, 20)
        }
    
    // View to display the load indicator
    private func loadingView() -> some View {
            ProgressView("Loading user data...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .padding(.top, 20)
        }
}

#Preview {
    UserSearchView()
}
