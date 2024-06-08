//
//  PlantItem.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-20.
//
/*
import Foundation
import SwiftData

/*
@Model
class PlantItem {
    let title: String?
    let detail: String?
    let image: Data?
    let favourite: Bool
    let price: Double
    let cart: Bool
    var category: PlantCategory
    
    init(title: String, 
         detail: String,
         image: Data?,
         favourite: Bool,
         price: Double,
         cart: Bool,
         category: PlantCategory
         
    ) {
        
        self.title = title
        self.detail = detail
        self.image = image
        self.favourite = favourite
        self.price = price
        self.cart = cart
        self.category = category
    }
}


struct PlantCategory {
    var id = UUID()
    var items: [PlantItem]
    
    init(id: UUID = UUID(), 
         items: [PlantItem]
         
    ) {
        
        self.id = id
        self.items = items
    }
    
    
}
*/


struct PlantItem: Decodable {
    var id = UUID()
    let title: String?
    let detail: String?
    let imageURL: URL
    let favourite: Bool
    let price: Double
    let cart: Bool
    var category: PlantCategory
    
    
    init(id: UUID = UUID(), 
         title: String?,
         detail: String?,
         imageURL: URL,
         favourite: Bool,
         price: Double,
         cart: Bool,
         category: PlantCategory
         
    ) {
        
        self.id = id
        self.title = title
        self.detail = detail
        self.imageURL = imageURL
        self.favourite = favourite
        self.price = price
        self.cart = cart
        self.category = category
    }
    
}


struct PlantCategory: Decodable {
    var id = UUID()
    var items: [PlantItem]
    
    init(id: UUID = UUID(),
         items: [PlantItem]
         
    ) {
        
        self.id = id
        self.items = items
    }
    
}
*/
