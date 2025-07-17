//
//  ContentView.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            UserSearchView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Users")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.colorPurple1)
                            .multilineTextAlignment(.center)
                    }
                }
                
        }
    }
}

#Preview {
    ContentView()
}
