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
                
                // User information with icons
                userInfoRow(title: "Email", value: user.email, icon: "envelope.fill")
                userInfoRow(title: "Address", value: user.address, icon: "house.fill")
                userInfoRow(title: "Phone", value: user.phone, icon: "phone.fill")
                
            }
            .padding()
            .navigationBarTitle("User Details", displayMode: .inline)
            
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
                       Text("User Details")
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
    
    // Auxiliary view for displaying rows of information with icons
    private func userInfoRow(title: String, value: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.colorPurple1)
            Text("\(title):")
                .font(.headline)
                .foregroundColor(.black)
            Text(value)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
        .shadow(radius: 2)
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


