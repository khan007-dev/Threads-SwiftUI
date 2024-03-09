//
//  AuthService.swift
//  TwitterClone
//
//  Created by Khan on 07.03.2024.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("failed \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("failed \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil 
    }
    
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String) async throws {
        
           let user = User(id: id, fullName: fullname, email: email, username: username)
            guard let userData = try? Firestore.Encoder().encode(user) else {return}
            try await Firestore.firestore().collection("users").document(id).setData(userData)
            
        
    }
}
