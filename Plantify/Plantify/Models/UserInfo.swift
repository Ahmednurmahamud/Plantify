//
//  Plant.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//


import Foundation
import SwiftData


@Model
class UserInfo {
    var user: User
    var favouriteplants: [FavouritePlant]
    
    init(user: User, favouriteplants: [FavouritePlant]) {
        self.user = user
        self.favouriteplants = favouriteplants
    }
    
}
