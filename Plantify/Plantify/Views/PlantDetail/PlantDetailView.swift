//
//  PlantDetailView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData


struct PlantDetailView: View {
    @Environment(PlantViewModel.self) private var viewModel
    @State private var isLiked: Bool = false
    @State private var quantity: Int = 1
    @Environment(\.modelContext) var context
    let plant: PlantData
    
    var body: some View {
            NavigationStack {
                VStack {
                    if let plantImage = plant.default_image?.medium_url {
                        let url = URL(string: plantImage)
                        AsyncImage(url: url) { image in
                            image
                                .image?.resizable()
                                .frame(height: 300)
                                .scaledToFit()
                        }
                    }
                    Spacer()
                    PlantInfoView(quantity: $quantity, plant: plant)
                        .padding(16)
                    
                    if let id = plant.id {
                        Button {
                            withAnimation {
                                if viewModel.isPlantInCart(id) {
                                    viewModel.removeFromCart(for: id)
                                } else {
                                    for _ in 1...quantity {
                                        viewModel.addToCart(for: id)
                                    }
                                }
                            }
                        } label: {
                            Text(viewModel.isPlantInCart(id) ? "Remove from Cart" : "Add to Cart")
                                .padding()
                                .frame(width: UIScreen.main.bounds.width - 32)
                        }
                        .buttonStyle(.primaryGreen)
                        .padding(.bottom, 12)
                    }
                }
                .navigationTitle("Detail")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    NavigationLink {
                        PlantCartView()
                    } label: {
                        CartButton()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        if let id = plant.id {
                            Button {
                                viewModel.toggleFavourite(for: id)
                            } label: {
                                Image(systemName: viewModel.isFavourite(id) ? "heart.fill" : "heart")
                                    .foregroundStyle(isLiked ? Color("PrimaryGreen") : Color("PrimaryGreen"))
                            }
                        }
                    }
                }
            }
        }
    }

#Preview {
    return PlantDetailView(plant: PlantData.example1())
       // .environment(PlantViewModel())
}
