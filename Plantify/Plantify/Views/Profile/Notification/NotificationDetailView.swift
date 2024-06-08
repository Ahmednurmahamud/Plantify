//
//  NotificationDetailView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct NotificationDetailView: View {
    
    @State private var isToggle: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Notification Settings").textCase(.uppercase)
                    .font(.caption).foregroundStyle(.gray)
                    .padding(.top)
                VStack(alignment: .leading, spacing: 12) {
                    Toggle("General Notifications", isOn: $isToggle)
                        .padding(.bottom, 8)
                    Divider()
                    Toggle("Vibrate", isOn: $isToggle)
                        .padding(.bottom, 8)
                    Spacer()
                }
            }
            .padding(.horizontal, 24)
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationDetailView()
}
