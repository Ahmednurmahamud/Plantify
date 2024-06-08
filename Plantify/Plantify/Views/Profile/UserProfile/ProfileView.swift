//
//  ProfileView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct ProfileView: View {
    @Environment(AuthViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                ProfileImageView(viewModel: viewModel, image: Image("snakeplant"))
                ProfileListView()
                
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Log out")
                        .foregroundStyle(.red)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderless)
                .padding()
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environment(AuthViewModel())
}
