//
//  PlantifyApp.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-09.
//

import SwiftUI
import Firebase
import SwiftData

@main
struct PlantappApp: App {
    let container: ModelContainer
    @State private var plantViewModel: PlantViewModel
    @State private var ratingViewModel: RatingViewModel
    
    init() {
        do {
            container = try ModelContainer(for: FavouritePlant.self, CartItem.self, PlantRating.self)
            let modelContext = container.mainContext
            self._plantViewModel = State(wrappedValue: PlantViewModel(modelContext: modelContext))
            self._ratingViewModel = State(wrappedValue: RatingViewModel(modelContext: modelContext))
        } catch {
            fatalError("Failed to create ModelContext")
        }
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(AuthViewModel())
                .environment(plantViewModel)
                .environment(ratingViewModel)
        }
        .modelContainer(container)
    }
}
