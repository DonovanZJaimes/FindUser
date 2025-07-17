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
                TextField("Buscar Usuario...", text: $userSearchViewModel.userSearched)
                    .padding(.horizontal, 10)
                    .frame(height:  48)
                    .keyboardType(.alphabet)
                    .autocorrectionDisabled()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: StrokeStyle(lineWidth: 1.5))
                            .foregroundStyle(.colorPurple2)
                    }
                
                Button {
                    Task {
                        await userSearchViewModel.loadUsers()
                        userSearchViewModel.filterUsers()
                    }
                } label: {
                    Image(systemName: "plus.magnifyingglass")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.colorPurple2)
                }
            }
            

        }
    }
    
   
}

#Preview(traits: .sizeThatFitsLayout) {
    SearchView(userSearchViewModel: UserSearchViewModel())
        .padding(.all, 20)
}




