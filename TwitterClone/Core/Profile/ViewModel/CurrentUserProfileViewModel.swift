//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by Khan on 09.03.2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            
            self?.currentUser = user
            print("Iser om view Model from combine \(user)")
            
        }.store(in: &cancellables)
    }
}
