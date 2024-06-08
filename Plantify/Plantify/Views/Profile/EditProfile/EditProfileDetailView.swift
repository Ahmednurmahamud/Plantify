//
//  EditProfileDetailView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI


struct EditProfileDetailView: View {
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    EditProfileListRowView(name: "NAME", content: "John Snow")
                    EditProfileListRowView(name: "EMAIL", content: "example@gmail.com")
                    EditProfileListRowView(name: "COUNTRY", content: "SWEDEN")
                    EditProfileListRowView(name: "NUMBER", content: "+46 111 467 378 399")
                }
            }
            .navigationTitle("Edit Profile")
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    EditProfileDetailView()
}
