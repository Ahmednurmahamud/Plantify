//
//  NetworkService.swift
//  Plantify
//
//  Created by Ahmednur Mahamud on 2024-03-06.
//

import Foundation



@Observable
class PlantService {
    let apiKey = "sk-r89766523973a657b5653"
    
    func fetchPlants() async throws -> PlantResponse {
        guard let url = URL(string: "https://perenual.com/api/species-list?key=\(apiKey)") else {
            throw NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                print("DEBUG: invalid statuscode: \(statusCode)")
            }
            throw NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Server Error"])
        }
        
        do {
            let plant = try JSONDecoder().decode(PlantResponse.self, from: data)
            return plant
        } catch {
            print("DEBUG: found error, throwing: \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchPlantsDescription(for plantId: Int) async throws -> String {
        guard let url = URL(string: "https://perenual.com/api/species/details/\(plantId)?key=\(apiKey)") else {
            throw NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Server Error"])
        }
        
        do {
            let plantDetail = try JSONDecoder().decode(PlantDetail.self, from: data)
            return plantDetail.description
        } catch {
            throw error
        }
    }
}

