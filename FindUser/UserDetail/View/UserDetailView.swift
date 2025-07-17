//
//  UserDetailView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI
struct UserDetailView: View {
    @Binding var user: UserInfo
    @State private var isVisible = false
    @Environment(\.presentationMode) var presentationMode  // We use this property to control backward navigation

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                    .foregroundStyle(Color.colorPurple1)
                
                // Usar la vista UserInfoRow
                UserInfoRow(title: "Email", value: user.email, icon: "envelope.fill")
                UserInfoRow(title: "Address", value: user.address, icon: "house.fill")
                UserInfoRow(title: "Phone", value: user.phone, icon: "phone.fill")
                
            }
            .padding()
            .navigationBarTitle("Detalles de usuario", displayMode: .inline)
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 0.6)) {
                    self.isVisible = true
                }
            }
        }
        .background(Color.background)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Detalles de usuario")
                    .font(.title)
                    .foregroundColor(Color.colorPurple2)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()   // Navigate backward manually
        }) {
            Image(systemName: "arrow.left.circle.fill")
                .foregroundColor(.colorPurple2)
                .font(.title)
        })
    }
}





struct ContentViewUserDetailView: View {
    @State private var user = UserInfo(name: "Juan Pérez", email: "juan.perez@dominio.com", address: "Calle Ficticia 123, Ciudad Imaginaria, País", phone: "+1234567890")
    
    var body: some View {
        UserDetailView(user: $user)
    }
}

#Preview {
    ContentViewUserDetailView()
}


