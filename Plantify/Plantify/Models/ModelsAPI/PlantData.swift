//
//  PlantData.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//

import Foundation

struct PlantData: Codable, Identifiable {
    let id : Int?
    let common_name : String?
    let scientific_name : [String]?
    let other_name : [String]?
    let cycle : String?
    let watering : String?
    let sunlight : [String]?
    let default_image : Default_image?
    let plantDescription: String?
    
    
    init(id: Int,
         common_name: String,
         scientific_name: [String],
         other_name : [String],
         cycle : String,
         watering : String,
         sunlight : [String],
         default_image : Default_image? = nil,
         plantDescription: String? = nil) {
        
        self.id = id
        self.common_name = common_name
        self.scientific_name = scientific_name
        self.other_name = other_name
        self.cycle = cycle
        self.watering = watering
        self.sunlight = sunlight
        self.default_image = default_image
        self.plantDescription = plantDescription
    }

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case common_name = "common_name"
        case scientific_name = "scientific_name"
        case other_name = "other_name"
        case cycle = "cycle"
        case watering = "watering"
        case sunlight = "sunlight"
        case default_image = "default_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        common_name = try values.decodeIfPresent(String.self, forKey: .common_name)
        scientific_name = try values.decodeIfPresent([String].self, forKey: .scientific_name)
        other_name = try values.decodeIfPresent([String].self, forKey: .other_name)
        cycle = try values.decodeIfPresent(String.self, forKey: .cycle)
        watering = try values.decodeIfPresent(String.self, forKey: .watering)
        sunlight = try values.decodeIfPresent([String].self, forKey: .sunlight)
        default_image = try values.decodeIfPresent(Default_image.self, forKey: .default_image)
        plantDescription = nil
    }
    
    
    static func example1() -> PlantData {
        return PlantData(id: 1,
                         common_name: "European Silver Fir",
                         scientific_name: ["Abies alba"],
                         other_name: ["Common Silver Fir"],
                         cycle: "Perennial",
                         watering: "Frequent",
                         sunlight: ["full sun"],
                         default_image: nil,
                         plantDescription: "This is a custom plant description.")
    }
    
    static func example2() -> PlantData {
        return PlantData(id: 2,
                         common_name: "Pyramidalis Silver Fir",
                         scientific_name: ["Abies alba 'Pyramidalis"],
                         other_name: [],
                         cycle: "Perennial",
                         watering: "Average",
                         sunlight: ["full sun"],
                         default_image: nil,
                         plantDescription: "This is a custom plant description.")
    }

}
