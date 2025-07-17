//
//  UserSearchView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct UserSearchView: View {
    //let userInfo =  UsersInfoMock()
    @State private var  userss = [UserInfo]()
    
    
    // Ejemplo de uso
    

    
    var body: some View {
        VStack {
            Text("Cantidad de usuarios: \(userss.count)")
            Text("\(userss)")
                }
            .onAppear{
                Task {
                    let utilsJson = UtilsJson()
                    let usersInfoMock = UsersInfoMock(jsonParser: utilsJson)
                    let userrIn = try await usersInfoMock.getUsers()
                    //userInfo.getUsers()
                    userss = userrIn
                }
            }
    }
}

#Preview {
    UserSearchView()
}
