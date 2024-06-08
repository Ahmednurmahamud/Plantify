//
//  CircularButton.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct CircularHeartButton: View {
    @Environment(PlantViewModel.self) private var viewModel
    let plant: PlantData
    @Environment(\.modelContext) var context
    
    var body: some View {
        if let id = plant.id {
            Button {
                withAnimation{
                    viewModel.toggleFavourite(for: id)
                }
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color("PrimaryGreen"))
                        .opacity(0.4)
                    Image(systemName: viewModel.isFavourite(id) ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isFavourite(id) ? Color("PrimaryGreen") : Color("PrimaryGreen"))
                        .font(.system(size: 17))
                }
            }
        }
    }
}

#Preview {
    CircularHeartButton(plant: PlantData.example1())
}
