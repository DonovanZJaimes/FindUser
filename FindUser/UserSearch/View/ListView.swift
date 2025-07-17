//
//  ListView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct ListView: View {
    @Binding var users : [UserInfo]
    var body: some View {
        List($users) { $user in
            UserCellView(user: $user)
            
        }
    }
}

struct ContentViewListView: View {
    @State private var users = [
        UserInfo(name: "Juan Pérez", email: "juan.perez@dominio.com", address: "+1234567890", phone: "Calle Ficticia 123, Ciudad Imaginaria, País"),
        UserInfo(name: "Ana Gómez", email: "ana.gomez@dominio.com", address: "+1234567890", phone: "Calle Ficticia 123, Ciudad Imaginaria, País"),
        UserInfo(name: "Carlos Rodríguez", email: "carlos.rodriguez@dominio.com", address: "+1234567890", phone: "Calle Ficticia 123, Ciudad Imaginaria, País")
    ]
    
    var body: some View {
        ListView(users: $users)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentViewListView()
        .padding(.all, 10)
}
