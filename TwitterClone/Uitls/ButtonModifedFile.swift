//
//  ButtonModifedFile.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import Foundation
import SwiftUI

struct ButtonModifedFile: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundStyle(.white)
        .frame(width: 352, height: 44)
        .background(.black)
        .cornerRadius(8)
    }
}
