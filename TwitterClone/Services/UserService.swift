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
    
    
    static func fetchUsers() async throws -> [User] {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return []}
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self)}
        return users.filter { $0.id != currentUid }
        }
        
        
    func reset() {
        self.currentUser = nil 
    }
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        
        self.currentUser?.profileImageUrl = imageUrl
    }
}
