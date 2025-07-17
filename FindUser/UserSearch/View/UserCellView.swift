//
//  UserCellView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct UserCellView: View {
    @Binding var user: UserInfo
    var body: some View {
        NavigationLink(destination: UserDetailView(user: $user)) {
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .foregroundStyle(Color.background)
                .overlay {
                    HStack {
                        VStack (alignment: .leading, spacing: 10){
                            Text(user.name)
                                .bold()
                                .foregroundStyle(Color.colorPurple2)
                            Text(user.email)
                                .padding(.leading, 10)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.leading, 25)
                        Spacer()
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .frame(height: 50)
                .padding()
                
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ContentViewUserCellView: View {
    @State private var user = UserInfo(name: "Juan Pérez", email: "juan.perez@dominio.com", address: "+1234567890", phone: "Calle Ficticia 123, Ciudad Imaginaria, País")
    
    var body: some View {
        UserCellView(user: $user)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentViewUserCellView()
        .padding(.all, 20)
}
