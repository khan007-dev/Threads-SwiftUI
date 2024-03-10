//
//  User.swift
//  TwitterClone
//
//  Created by Khan on 09.03.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
