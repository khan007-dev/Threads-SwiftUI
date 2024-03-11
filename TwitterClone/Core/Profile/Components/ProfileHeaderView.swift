//
//  ProfileHeaderView.swift
//  TwitterClone
//
//  Created by Khan on 11.03.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user = User(id: NSUUID().uuidString, fullName: "Ab Waris", email: "ab@gmail.com", username: "ABWARIS")
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 12) {
                VStack (alignment: .leading, spacing: 4) {
                    
                    Text(user.fullName)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.username)
                        .font(.subheadline)
                    
                }
                
              
                if let bio = user.bio {
                    Text(bio)
                        .font(.subheadline)
                }
            
                
                Text("2 follwers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            CircularProfileImageView()
        }
    }
}

#Preview {
    ProfileHeaderView()
}
