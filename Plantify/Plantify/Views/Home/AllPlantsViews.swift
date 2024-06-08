//
//  AllPlantsViews.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct AllPlantsViews: View {
    @Environment(PlantViewModel.self) var viewModel
//    @State var viewModel = PlantViewModel()
    let plants: [PlantData]
    @State private var isShowingErrorAlert = false
    @State private var errorMessage = ""

    // Use to create Two Column Grid
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(plants){ plant in
                        PlantCardVerticalView(plant: plant)
                    }
                })
                .padding(.top, 8)
                .padding(.horizontal, 16)
            }
            .navigationTitle("All Plants")
        }
        .alert(isPresented: $isShowingErrorAlert){
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
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
    // @State var previewPlantViewModel = PlantViewModel()
    return AllPlantsViews(plants: [])
       // .environment(previewPlantViewModel)
}
