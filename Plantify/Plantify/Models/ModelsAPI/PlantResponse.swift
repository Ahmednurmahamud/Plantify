//
//  PlantResponse.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//

import Foundation

struct PlantResponse: Codable {

    let data : [PlantData]?
    let to : Int?
    let per_page : Int?
    let current_page : Int?
    let from : Int?
    let last_page : Int?
    let total : Int?
    

}
