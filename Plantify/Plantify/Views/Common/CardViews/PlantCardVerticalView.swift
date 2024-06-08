//
//  PlantCardVerticalView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI

struct PlantCardVerticalView: View {
    @State private var isLiked = false
    let plant: PlantData
    @State private var plantImage: UIImage? = nil
    
    var body: some View {
        NavigationLink(destination: PlantDetailView(plant: plant)) {
            VStack(alignment: .leading) {
                //ImageView()
                ZStack(alignment: .topTrailing) {
                    if let imageUrlString = plant.default_image?.medium_url,
                       let imageUrl = URL(string: imageUrlString) {
                        if let image = plantImage {
                            Image(uiImage: image)
                                .resizable()
                                .frame(height: 170)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        } else {
                            ProgressView()
                                .frame(height: 100)
                                .onAppear {
                                    loadImage(from: imageUrl)
                                }
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                    }
                    CircularHeartButton(plant: plant)
                        .padding(8)
                }
        
                //Detail
                VStack(alignment: .leading) {
                    HStack {
                        Text(plant.common_name ?? "Unknown")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                            .lineLimit(1)
                        Spacer()
                        Text("$20")
                            .font(.headline)
                            .foregroundStyle(Color("PrimaryGreen"))
                    }
                    Text("Indoor")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            .padding(8)
            .frame(width: 160)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
                    .foregroundStyle(Color.white)
                    
            }
            .padding()
        }
    }
    
    private func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.plantImage = image
                }
            }
        }.resume()
    }
}

#Preview {
    PlantCardVerticalView(plant: PlantData.example1())
}
