//
//  ProfileImageView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct ProfileImageView: View {
    
    let viewModel: AuthViewModel
    
    var image: Image
    
    var body: some View {
        if let user = viewModel.currentUser {
            Section {
                HStack(alignment: .top, spacing: 12) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullName)
                            .font(.title2).fontWeight(.semibold)
                        Text(user.email)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
            }
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
            }
        }
    }
}

#Preview {
    ProfileImageView(viewModel: AuthViewModel(), image: Image("snakeplant"))
}
