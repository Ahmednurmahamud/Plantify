//
//  EditProfileView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI


struct EditProfileView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink {
                EditProfileDetailView()
            } label: {
                Label("Edit Profile", systemImage: "person.fill")
                    .foregroundStyle(.black)
            }
            Divider()
        }
    }
}

#Preview {
    EditProfileView()
}
