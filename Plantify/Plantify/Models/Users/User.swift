//
//  User.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-20.
//

import Foundation


/*
@Model
final class User {
    var firstName: String
    var lastName: String
    let email: String
    var phone: Int
    let dob: Date
    var address: Address
    
    init(firstName: String,
         lastName: String,
         email: String, phone: Int,
         dob: Date,
         address: Address
    
    ) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.dob = dob
        self.address = address
        
    }
}*/

struct User: Identifiable, Codable {
    
    let id: String
    var fullName: String
    var email: String
    
}

extension User {
    static var Mock_User = User(id: UUID().uuidString,
                                fullName: "John Doe",
                                email: "test@gmail.com")
}


struct Address {
    var street: String
    var city: String
    var country: String
    
}
