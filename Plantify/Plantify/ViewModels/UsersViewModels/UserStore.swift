//
//  PlantifyViewModel.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-21.
//

import Foundation
import Observation
import SwiftData

@Observable
class UserStore {
    let modelContext: ModelContext
    let authViewModel: AuthViewModel
    var currentUser: UserInfo?
    
   
    init(modelContext: ModelContext, authViewModel: AuthViewModel) {
        self.modelContext = modelContext
        self.authViewModel = authViewModel

    }
    @MainActor private func fetchUserFromPersistence() {
   
        do {
            let descriptor = FetchDescriptor<UserInfo>()
            let users = try modelContext.fetch(descriptor)
            for user in users {
                if authViewModel.currentUser?.id == user.user.id {
                    currentUser = user
                    return
                }
            }
            
            if let currentUserID = authViewModel.currentUser?.id {
                let newUser = User(id: currentUserID, fullName: authViewModel.currentUser?.fullName ?? "New User", email: authViewModel.currentUser?.email ?? "No email")
                addUser(user: newUser)
            }
            
        } catch {
            print("Failed to fetch from model context")
        }
    }
    
    @MainActor func addUser(user: User) {
        let userInfo = UserInfo(user: user, favouriteplants: [])
        modelContext.insert(userInfo)
        self.currentUser = userInfo
        
    }
    
}
