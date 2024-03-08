//
//  ContentViewModel.swift
//  TwitterClone
//
//  Created by Khan on 08.03.2024.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [ weak self ] userSession in
        
            self?.userSession = userSession
        }.store(in: &cancellable)
    }
}
