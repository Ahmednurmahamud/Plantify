//
//  PlantCardHorizontalView.swift
//  Plantify
//
//  Created by Jinikho on 2024-03-04.
//

import SwiftUI


struct PlantCardHorizontalView: View {
    
    let plant: PlantData
    @State private var plantImage: UIImage? = nil
    
    var body: some View {
        HStack(alignment: .center) {
            if let imageUrlString = plant.default_image?.medium_url,
               let imageUrl = URL(string: imageUrlString) {
                if let image = plantImage {
                    Image(uiImage: image)
                        .resizable()
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
            VStack(alignment: .leading, spacing: 4) {
                Text(plant.common_name ?? "")
                    .font(.headline)
                    .lineLimit(1)
                //.padding(.top, 4)
                if let otherNames = plant.other_name {
                    Text("Also known as: \(otherNames.joined(separator: " "))")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        
                } else {
                    Text("Also known as: ")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                HStack(alignment: .center) {
                    Text("$20")
                        .font(.headline)
                        .foregroundStyle(Color("PrimaryGreen"))
                    Spacer()
                    CircularHeartButton(plant: plant)
                }
            }
        }
        .frame(width: 240, height: 120)
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
                .foregroundStyle(Color.white)
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
    PlantCardHorizontalView(plant: PlantData.example2())
}
