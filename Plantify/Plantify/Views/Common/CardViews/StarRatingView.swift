//
//  StarRatingView.swift
//  Plantify
//
//  Created by Jinikho on 2024-05-24.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maxRating = 5

    var body: some View {
        HStack {
            ForEach(1..<maxRating + 1, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .font(.system(size: 15))  //   size of  stars
                    .foregroundColor(index <= rating ? Color("PrimaryGreen") : Color.gray)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("PrimaryGreen"), lineWidth: 1)
        )
    }
}
