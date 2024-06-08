////
////  Encodable+ConvertingToDic.swift
////  Plantify
////
////  Created by Jinikho on 2024-02-27.
////
//
//import Foundation
//
//extension Encodable {
//    func asDictionary() -> [String: Any] {
//        guard let data = try? JSONEncoder().encode(self) else {
//            return[:]
//        }
//        do {
//            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
//            return json ?? [:]
//        } catch {
//            return [:]
//        }
//    }
//}
