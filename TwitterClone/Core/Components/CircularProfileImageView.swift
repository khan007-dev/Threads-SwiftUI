//
//  CircularProfileImageView.swift
//  TwitterClone
//
//  Created by Khan on 01.03.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image(.hello)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
