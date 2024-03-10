//
//  ExplorerViewModel.swift
//  TwitterClone
//
//  Created by Khan on 10.03.2024.
//

import Foundation
class ExplorerViewModel: ObservableObject {
    @Published var users = [User]()
    
    init(){
        
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
