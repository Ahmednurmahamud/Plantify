//
//  PlantRating.swift
//  Plantify
//
//  Created by Jinikho on 2024-05-24.
//

import Foundation
import SwiftData

@Model
class PlantRating: Identifiable {
    var id: Int
    var rating: Int
    
    init(id: Int, rating: Int) {
        self.id = id
        self.rating = rating
    }
}
