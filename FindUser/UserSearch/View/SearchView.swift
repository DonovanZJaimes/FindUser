//
//  SearchView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var userSearchViewModel: UserSearchViewModel
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                TextField("Find User...", text: $userSearchViewModel.userSearched)
                    .padding(.horizontal, 10)
                    .frame(height:  48)
                    .keyboardType(.alphabet)
                    .autocorrectionDisabled()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundStyle(Color.black)
                    }
                
                Button {
                    print("buscar \(userSearchViewModel.userSearched)")
                    loadDataAndFilter()
                } label: {
                    Image(systemName: "plus.magnifyingglass")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.brown)
                }
            }
            

        }
    }
    
    private func loadDataAndFilter() {
        Task {
            do {
                let users = try await userSearchViewModel.getUsersInfo()
                userSearchViewModel.usersInfo = users
                
                let filteredUsers = userSearchViewModel.filteredUsers()
                userSearchViewModel.usersInfo = filteredUsers
            } catch {
                print("Error al obtener usuarios: \(error.localizedDescription)")
                userSearchViewModel.errorMessage = "Error al cargar los datos"
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchView(userSearchViewModel: UserSearchViewModel())
        .padding(.all, 20)
}




