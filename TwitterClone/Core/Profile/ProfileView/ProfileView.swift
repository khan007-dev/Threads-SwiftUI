//
//  ProfileView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct ProfileView: View {
    let user = User(id: NSUUID().uuidString, fullName: "Ab Waris", email: "ab@gmail.com", username: "ABWARIS")
    @State private var selectedFilter: ProfileThreadFilter = .threds
    @Namespace var animation
    private var fitlerBarWidht: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    
    var body: some View {
       
            ScrollView(showsIndicators:false) {
                
                VStack (spacing: 20) {
               ProfileHeaderView()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
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
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        
       
    }
}

#Preview {
    ProfileView()
}
