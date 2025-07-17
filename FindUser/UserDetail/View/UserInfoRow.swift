//
//  UserInfoRow.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 17/07/25.
//

import SwiftUI

struct UserInfoRow: View {
    var title: String
    var value: String
    var icon: String
    
    var body: some View {
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

#Preview {
    UserInfoRow(title: "Email", value: "juan.perez@dominio.com", icon: "envelope.fill")
}
