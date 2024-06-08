//
//  FavouriteTopNavButtonsView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct FavouriteTopNavButtonsView: View {
    
    @State private var selectedCategory: String?
    
    let categories = ["indoor", "outdoor", "flowering plants"]
    
    let rows = [
        GridItem(spacing: 16)
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: rows){
                ForEach(categories, id: \.self) { category in
                    Button {
                        selectedCategory = category
                    } label: {
                        Text(category)
                            .foregroundStyle(Color.gray)
                            .frame(width: 150)
                    }
                    .buttonStyle(.bordered)
                    .opacity(selectedCategory == category ? 1 : 0.5)
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(height: 80)
    }
}

#Preview {
    FavouriteTopNavButtonsView()
}
