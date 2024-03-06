//
//  CreateThreadView.swift
//  TwitterClone
//
//  Created by Khan on 06.03.2024.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
       
        NavigationStack {
            VStack {
                
                HStack (alignment: .top) {
                    CircularProfileImageView()
                    VStack (alignment: .leading, spacing: 4) {
                        Text("Abdul Waris")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread....", text:$caption, axis: .vertical )
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button(action: {
                            caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                }
            
                Spacer()
               
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button("Cacnel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button("Post") {
                        
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
