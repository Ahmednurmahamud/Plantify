//
//  CartItem.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//



import Foundation

import SwiftData

// Cart Item Model
@Model
class CartItem {
    
    var quantity: Int
    let id: Int
    
    init(quantity: Int, id: Int) {
        self.quantity = quantity
        self.id = id
    }
}

