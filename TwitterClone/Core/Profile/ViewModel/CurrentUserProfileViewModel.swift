//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by Khan on 09.03.2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI
class CurrentUserProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
   
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            
            self?.currentUser = user
            
            
        }.store(in: &cancellables)
    }
    
 
}
