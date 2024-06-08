//
//  CartItemCardView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData

struct CartItemCardView: View {
    
    let plant: PlantData
    @State private var quantity = 1
    @Environment(PlantViewModel.self) private var viewModel
    @State private var plantImage: UIImage? = nil
    
    var body: some View {
            HStack(alignment: .top) {
                if let plantsImage = plant.default_image?.medium_url {
                    let url = URL(string: plantsImage)
                    AsyncImage(url: url) { image in
                        image
                            .image?.resizable()
                            .frame(width: 120, height: 120)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                Spacer()
                
                // Detail
                VStack(alignment: .leading, spacing: 4) {
                    if let plantName = plant.common_name {
                        Text(plantName)
                            .font(.headline)
                    }
                    
                    // Dynamically calculate the price
                    Text("$\(viewModel.getPlantPrice(for: plant.id ?? 0))")
                        .font(.headline)
                        .foregroundStyle(Color("PrimaryGreen"))
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        HStack(spacing: 16) {
                            Button {
                                if let id = plant.id {
                                    viewModel.decreaseQuantity(for: id)
                                }
                            } label: {
                                Text("-")
                                    .font(.title)
                            }
                            Text("\(viewModel.getQuantity(for: plant.id ?? 0))")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Button {
                                if let id = plant.id {
                                    viewModel.increaseQuantity(for: id)
                                }
                            } label: {
                                Text("+")
                                    .font(.title2)
                            }
                        }
                        .padding(8)
                        .foregroundStyle(Color("PrimaryGreen"))
                        .frame(width: 120)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color.gray)
                                .opacity(0.2)
                        }

                        Spacer()
                        
                        if let id = plant.id {
                            Button(action: {
                                viewModel.removeFromCart(for: id)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundStyle(Color("PrimaryGreen"))
                            }
                        }
                    }
                }
            }
            .frame(height: 120)
        }
    }



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    return CartItemCardView(plant: PlantData.example1())
        .environment(previewPlantViewModel)
}
