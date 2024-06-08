//
//  RatingViewModel.swift
//  Plantify
//
//  Created by Jinikho on 2024-05-24.
//

import Foundation
import SwiftData

@Observable
class RatingViewModel {
    let modelContext: ModelContext
    var plantRatings: [PlantRating] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchRatings()
    }
    
    func fetchRatings() {
        do {
            let descriptor = FetchDescriptor<PlantRating>()
            let ratings = try modelContext.fetch(descriptor)
            self.plantRatings = ratings
        } catch {
            print("Failed to fetch ratings from model context")
        }
    }
    
    func setRating(for plantId: Int, rating: Int) {
        if let existingRating = plantRatings.first(where: { $0.id == plantId }) {
            existingRating.rating = rating
        } else {
            let newRating = PlantRating(id: plantId, rating: rating)
            modelContext.insert(newRating)
            plantRatings.append(newRating)
        }
        do {
            try modelContext.save()
        } catch {
            print("Failed to save rating: \(error)")
        }
    }
    
    func getRating(for plantId: Int) -> Int {
        return plantRatings.first(where: { $0.id == plantId })?.rating ?? 0
    }
}

