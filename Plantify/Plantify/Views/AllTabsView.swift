//
//  AllTabsView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct AllTabsView: View {
    
    var body: some View {
        TabView {
            PlantAppHomeView()
                .tabItem {
                    Label(
                        "Home",
                        systemImage: "tree"
                    )
                }
            PlantFavouriteView()
                .tabItem {
                    Label(
                        "Favourite",
                        systemImage: "heart.fill"
                    )
                }
            PlantCartView()
                .tabItem {
                    Label(
                        "Cart",
                        systemImage: "cart"
                    )
                }
            ProfileView()
                .tabItem {
                    Label(
                        "Profile",
                        systemImage: "person.fill"
                    )
                }
        }
        .tint(Color("PrimaryGreen"))
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style:.systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.white.opacity(1))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    AllTabsView()
        .environment(AuthViewModel())
}
