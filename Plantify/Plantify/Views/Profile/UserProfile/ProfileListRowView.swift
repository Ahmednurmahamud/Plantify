//
//  ProfileListRowView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI


struct ProfileListRowView: View {
    
    var systemImageName: String
    var text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImageName)
            
            Text(text)
               .font(.system(size: 17))
               .fontWeight(.regular)
        }
        .padding()
    }
}
