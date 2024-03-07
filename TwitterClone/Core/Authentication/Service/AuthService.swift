//
//  AuthService.swift
//  TwitterClone
//
//  Created by Khan on 07.03.2024.
//

import Foundation
import FirebaseAuth
class AuthService {
    
    static let shared = AuthService()
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Created User \(result.user.uid)")
        } catch {
            print("failed \(error.localizedDescription)")
        }
    }
}
