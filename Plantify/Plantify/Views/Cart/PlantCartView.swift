//
//  PlantCartView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData

struct PlantCartView: View {
    
    @Environment(PlantViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.getCartPlants()) { plant in
                        CartItemCardView(plant: plant)
                            .padding()
                        Divider()
                    }
                }
                .padding()
                
                if viewModel.getCartPlants().isEmpty {
                    Image("cartEmpty")
                    ContentUnavailableView("Your cart is empty",
                                           systemImage: "cart",
                                           description: Text("You don't have any items added to your cart. You need to add items before checkout."))
                }
            }
            .navigationTitle("Cart")
            
            if !viewModel.getCartPlants().isEmpty{
                HStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Total Price")
                            .foregroundColor(.gray)
                            .bold()
                        
                        Text("$\(viewModel.calculateTotalPrice()).00")
                            .bold()
                    }.padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: PaymentDetails()){
                        HStack {
                            Text("Checkout")
                                .bold()
                                .foregroundColor(.white)
                            Image(systemName: "arrow.forward")
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color("PrimaryGreen"))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
    
}



#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    return PlantCartView()
        .environment(previewPlantViewModel)
}
