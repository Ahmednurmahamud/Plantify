//
//  PlantInfoView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData

struct PlantInfoView: View {
    
    @Environment(PlantViewModel.self) private var viewModel
    @Binding var quantity: Int
    @Environment(RatingViewModel.self) private var ratingViewModel
    @State private var rating: Int = 0
    let plant: PlantData
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                HStack {
                    if let plantName = plant.common_name {
                        Text(plantName)
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    StarRatingView(rating: $rating)
                        .padding(.vertical, 8)
                        .onAppear {
                            if let id = plant.id {
                                rating = ratingViewModel.getRating(for: id)
                            }
                        }
                        .onChange(of: rating) { newRating in
                            if let id = plant.id {
                                ratingViewModel.setRating(for: id, rating: newRating)
                            }
                        }
                }
                
                Text(plant.plantDescription ?? "No description.")
                    .foregroundStyle(Color.gray)
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Price")
                            .foregroundStyle(Color.gray)
                        Text("$\(viewModel.getPlantPrice(for: plant.id ?? 0) )")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("PrimaryGreen"))
                    }
                    Spacer()
                    HStack(spacing: 16) {
                        Button {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        } label: {
                            Text("-")
                                .font(.title)
                        }
                        .disabled(quantity == 1)
                        Text("\(quantity)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Button {
                            quantity += 1
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
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    @State var quantity = 1
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    return PlantInfoView(quantity: $quantity, plant: PlantData.example1())
        .environment(previewPlantViewModel)
}
