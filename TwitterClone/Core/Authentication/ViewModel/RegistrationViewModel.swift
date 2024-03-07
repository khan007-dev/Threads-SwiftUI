//
//  RegistrationViewModel.swift
//  TwitterClone
//
//  Created by Khan on 07.03.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published  var email = ""
    @Published  var password = ""
    @Published  var fullName = ""
    @Published  var userName = ""
    @MainActor
    func createUser() async throws {
      try await  AuthService.shared.createUser(withEmail: email, password: password, fullname: fullName, username: userName)
    }
}
