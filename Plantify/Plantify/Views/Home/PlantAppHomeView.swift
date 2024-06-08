//
//  PlantAppHomeView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI
import SwiftData


struct PlantAppHomeView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            PlantHomeHorizontalView(searchText: $searchText)
        }
        .searchable(text: $searchText)
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FavouritePlant.self, configurations: config)
    
    @State var previewPlantViewModel = PlantViewModel(modelContext: container.mainContext)
    
    return PlantAppHomeView()
        .environment(previewPlantViewModel)
}
