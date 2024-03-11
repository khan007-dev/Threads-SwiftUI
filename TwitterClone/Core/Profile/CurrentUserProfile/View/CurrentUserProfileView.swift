//
//  CurrentUserProfileView.swift
//  TwitterClone
//
//  Created by Khan on 11.03.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threds
    @Namespace var animation
    private var fitlerBarWidht: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    private var currentUser:User? {
        return viewModel.currentUser
    }
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators:false) {
                
                VStack (spacing: 20) {
                    HStack {
                        VStack (alignment: .leading, spacing: 12) {
                            VStack (alignment: .leading, spacing: 4) {
                                
                                Text(currentUser?.fullName ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                                
                            }
                            
                          
                            if let bio = currentUser?.bio {
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
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    })
                    
                
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) { filter in
                            
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                    
                                    if selectedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(.black)
                                            .frame(width: fitlerBarWidht, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(.clear)
                                            .frame(width: fitlerBarWidht, height: 1)
                                    }
                                }.onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedFilter = filter
                                    }
                                }
                            }
                        }
                    }
                    LazyVStack {
                       
                        ForEach (0...10, id: \.self) { thread in
                            ThreadCellView()
                        }
                    }
                    .padding(.vertical, 8)
                }
                
            
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }

                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
