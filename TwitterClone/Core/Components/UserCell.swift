//
//  UserCell.swift
//  TwitterClone
//
//  Created by Khan on 01.03.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
           CircularProfileImageView()
            
            VStack (alignment: .leading) {
                Text("Ab Waris")
                    .fontWeight(.semibold)
                Text("Khan")
                   
            }.font(.footnote)
            
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 80, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }.padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
