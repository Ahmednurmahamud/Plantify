//
//  ContentView.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-09.
//

import SwiftUI

struct RootView: View {
    @Environment(AuthViewModel.self) private var viewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                AllTabsView()
            } else {
                LandingPageView()
            }
        }
    }
}

#Preview {
    @State var viewModel = AuthViewModel()
    return RootView()
        .environment(viewModel)
}

