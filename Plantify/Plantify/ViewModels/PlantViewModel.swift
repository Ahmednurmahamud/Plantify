//
//  PlantViewModel.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//

import Foundation
import SwiftData

@Observable
class PlantViewModel {
    let modelContext: ModelContext
    var plants: [PlantData] = []
    var favouritePlants: [FavouritePlant] = []
    var plantsInCart: [CartItem] = []
    private let service = PlantService()
    private(set) var isLoading = false
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        Task { await fetchPlants() }
        fetchFromPersistence()
        fetchForCart()
    }
    
    func fetchFromPersistence() {
        do {
            let descriptor = FetchDescriptor<FavouritePlant>()
            let favouritePlants = try modelContext.fetch(descriptor)
            self.favouritePlants = favouritePlants
        } catch {
            print("Failed to fetch from model context")
        }
    }
    
    func toggleFavourite(for plantId: Int) {
        if favouritePlants.contains(where: { $0.id == plantId }) {
            guard let plantToDelete = favouritePlants.first(where: { $0.id == plantId }) else { return }
            modelContext.delete(plantToDelete)
            fetchFromPersistence()
        } else {
            let newFavourite = FavouritePlant(id: plantId)
            modelContext.insert(newFavourite)
            fetchFromPersistence()
        }
    }
    
    func getFavouritePlants() -> [PlantData] {
        var favouritePlants = [PlantData]()
        for plant in plants {
            if self.favouritePlants.contains(where: { $0.id == plant.id }) {
                favouritePlants.append(plant)
            }
        }
        return favouritePlants
    }
    
    func isFavourite(_ plantId: Int) -> Bool {
        return favouritePlants.contains(where: { $0.id == plantId })
    }
    
    private func fetchForCart() {
        do {
            let descriptor = FetchDescriptor<CartItem>()
            let cartPlants = try modelContext.fetch(descriptor)
            self.plantsInCart = cartPlants
        } catch {
            print("Failed to fetch from model context")
        }
    }
    
    func isPlantInCart(_ plantId: Int) -> Bool {
        return plantsInCart.contains(where: { $0.id == plantId })
    }
    
    func addToCart(for cartID: Int) {
        if let index = plantsInCart.firstIndex(where: { $0.id == cartID }) {
            plantsInCart[index].quantity += 1
        } else {
            let newPlantInCart = CartItem(quantity: 1, id: cartID)
            modelContext.insert(newPlantInCart)
        }
        fetchForCart()
    }
    
    func clearCart() {
      for item in plantsInCart {
        modelContext.delete(item)
      }
      plantsInCart.removeAll()
      saveCartState()
    }

    private func saveCartState() {
      do {
        try modelContext.save()
      } catch {
        print("Failed to save cart state: \(error.localizedDescription)")
      }
    }
    
    func removeFromCart(for cartID: Int) {
        guard let index = plantsInCart.firstIndex(where: { $0.id == cartID }) else { return }
        modelContext.delete(plantsInCart[index])
        fetchForCart()
    }
    
    func increaseQuantity(for plantId: Int) {
        if let index = plantsInCart.firstIndex(where: { $0.id == plantId }) {
            plantsInCart[index].quantity += 1
        }
        fetchForCart()
    }
    
    func decreaseQuantity(for plantId: Int) {
        if let index = plantsInCart.firstIndex(where: { $0.id == plantId }) {
            if plantsInCart[index].quantity > 1 {
                plantsInCart[index].quantity -= 1
            } else {
                modelContext.delete(plantsInCart[index])
            }
        }
        fetchForCart()
    }
    
    func getQuantity(for plantId: Int) -> Int {
        return plantsInCart.first(where: { $0.id == plantId })?.quantity ?? 0
    }
    
    func totalQuantity() -> Int {
            return plantsInCart.reduce(0) { $0 + $1.quantity }
        }
    
    func getPlantPrice(for plantId: Int) -> Int {
        let basePrice = 20 // base price is $20
        let quantity = getQuantity(for: plantId)
        return basePrice * quantity
    }
    
    func calculateTotalPrice() -> Int {
            let basePrice = 20 //  base price is $20 for each plant
            return plantsInCart.reduce(0) { $0 + basePrice * $1.quantity }
        }
    
    func getCartPlants() -> [PlantData] {
        var cartPlants = [PlantData]()
        for plant in plants {
            if self.plantsInCart.contains(where: { $0.id == plant.id }) {
                cartPlants.append(plant)
            }
        }
        return cartPlants
    }
    
    func fetchPlants() async {
        do {
            isLoading = true
            let plantResponse = try await service.fetchPlants()
            if let data = plantResponse.data {
                let plantsWithDescriptions = await loadPlantDescriptions(for: data)
                Task { @MainActor in
                    self.plants = plantsWithDescriptions
                    isLoading = false
                }
            }
        } catch {
            print("Error fetching plants \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    private func loadPlantDescriptions(for plants: [PlantData]) async -> [PlantData] {
        var newPlants = [PlantData]()
        for plant in plants {
            if let newPlant = await newPlant(oldPlant: plant) {
                newPlants.append(newPlant)
            }
        }
        return newPlants
    }
    
    private func newPlant(oldPlant plant: PlantData) async -> PlantData? {
        guard let id = plant.id,
              let name = plant.common_name,
              let otherName = plant.other_name,
              let scientificName = plant.scientific_name,
              let cycle = plant.cycle,
              let watering = plant.watering,
              let sunlight = plant.sunlight else {
            return nil
        }
        
        let plantDescription = try? await service.fetchPlantsDescription(for: id)
        let newPlant = PlantData(id: id, common_name: name, scientific_name: scientificName, other_name: otherName, cycle: cycle, watering: watering, sunlight: sunlight, default_image: plant.default_image, plantDescription: plantDescription)
        
        return newPlant
    }
}
