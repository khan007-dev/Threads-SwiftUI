//
//  ThreadCellView.swift
//  TwitterClone
//
//  Created by Khan on 01.03.2024.
//

import SwiftUI

struct ThreadCellView: View {
    var body: some View {
     
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image(.hello)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack (alignment: .leading, spacing: 4) {
                  
                    HStack {
                        Text("Abdul Waris Khan")
                            .font(.caption)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.gray)
                        })
                    }
                    Text("I am Elite iOS Engineer ")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)

                    HStack (spacing: 16) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                  
                }
              
               
            }
            
          Divider()
        }
        .padding()
   
        
    }
}

#Preview {
    ThreadCellView()
}
