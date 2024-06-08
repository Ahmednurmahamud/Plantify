//
//  PlantFavouriteView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData

struct PlantFavouriteView: View {
    @Environment(PlantViewModel.self) var viewModel
//    @State var viewModel = PlantViewModel()

    // Use to create Two Column Grid
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        NavigationStack {
            FavouriteTopNavButtonsView()
                .padding(.horizontal, 16)
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.getFavouritePlants()){ plant in
                        PlantCardVerticalView(plant: plant)
                    }
                    .padding(.bottom, 8)
                })
                .padding(.horizontal, 16)
            }
            .navigationTitle("Favourites")
            .toolbar {
                NavigationLink {
                    PlantCartView()
                } label: {
                    CartButton()
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    return PlantFavouriteView()
        .environment(previewPlantViewModel)
}
