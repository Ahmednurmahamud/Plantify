//
//  PrivacyPolicyView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        VStack(alignment: .leading){
            NavigationLink {
                PrivacyPolicyDetailView()
            } label: {
                 Label("Privacy Policy", systemImage: "lock.fill")
                    .foregroundStyle(.black)
            }
            Divider()
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
