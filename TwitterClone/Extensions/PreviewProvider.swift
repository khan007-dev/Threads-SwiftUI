//
//  PreviewProvider.swift
//  TwitterClone
//
//  Created by Khan on 10.03.2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview
    {
        return DeveloperPreview.shared
    }
 
}
class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Ab Waris", email: "ab@gmail.com", username: "ABWARIS")
}
