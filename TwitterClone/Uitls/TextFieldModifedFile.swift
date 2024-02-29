//
//  TextFieldModifedFile.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import Foundation
import SwiftUI

struct TextFieldModifedFile: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
