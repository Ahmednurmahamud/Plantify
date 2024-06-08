//
//  PlantHomeHorizontalView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData


struct PlantHomeHorizontalView: View {
    @Environment(PlantViewModel.self) var viewModel
    @Binding var searchText: String
    
    var displayedPlants: [PlantData] {
           Array(filteredPlants.prefix(10)) // Limiting to the first 10 plants
       }
    
    var filteredPlants: [PlantData] {
        if searchText.isEmpty {
            return viewModel.plants
        } else {
            return viewModel.plants.filter {
                if let name = $0.common_name {
                    return name.lowercased().contains(searchText.lowercased())
                } else {
                    return false
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Special Offers")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: AllPlantsViews(plants: viewModel.plants)) {
                        HStack(alignment: .center) {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(Color("PrimaryGreen"))
                    }
                }
                ScrollView(.horizontal) {
                    LazyHStack {
                        if viewModel.isLoading {
                           ProgressView()
                                .padding()
                        } else {
                            ForEach(displayedPlants, id: \.id) { plant in
                                PlantCardVerticalView(plant: plant)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Top Seller")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                ScrollView(.horizontal) {
                    LazyHStack {
                        if viewModel.isLoading {
                           ProgressView()
                                .padding()
                        } else {
                            ForEach(viewModel.plants) { plant in
                                PlantCardHorizontalView(plant: plant)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .toolbar {
            NavigationLink {
                PlantCartView()
            } label: {
                CartButton()
            }
        }
    }
    
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    @State var searchText = ""
    return PlantHomeHorizontalView(searchText: $searchText)
        .environment(previewPlantViewModel)
}

