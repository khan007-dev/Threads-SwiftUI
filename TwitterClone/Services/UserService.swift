//
//  UserService.swift
//  TwitterClone
//
//  Created by Khan on 09.03.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    init()
    {
        Task {
            try await    fetchCurentUser()
        }
    }
    @MainActor
    func fetchCurentUser()  async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: User is \(user)")
    }
    
    func reset() {
        self.currentUser = nil 
    }
}
