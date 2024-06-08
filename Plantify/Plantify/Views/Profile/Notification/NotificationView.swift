//
//  NotificationView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            NavigationLink {
                NotificationDetailView()
            } label: {
                Label("Notifications", systemImage: "bell.fill")
                    .foregroundStyle(.black)
            }
            Divider()
        }
    }
}

#Preview {
    NotificationView()
}
