//
//  ProfileListView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct ProfileListView: View {
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("SETTINGS")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        EditProfileView()
                        NotificationView()
                        PrivacyPolicyView()
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    ProfileListView()
}
