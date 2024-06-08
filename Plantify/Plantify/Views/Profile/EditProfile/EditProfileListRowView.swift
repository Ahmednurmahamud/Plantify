//
//  EditProfileListRowView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct EditProfileListRowView: View {
    let name: String
    let content: String
    
    var body: some View {
        VStack(spacing: 12) {
            VStack(alignment: .leading) {
                Text(name).padding(.horizontal, 8).font(.caption).foregroundStyle(.gray)
                Text(content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(Color(red: 0.95, green: 0.95, blue: 0.95))
                    }
            }
            .padding(.vertical, 6)
        }
    }
}
