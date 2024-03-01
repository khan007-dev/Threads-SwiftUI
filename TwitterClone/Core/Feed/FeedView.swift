//
//  FeedView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        
        NavigationStack {
            
          
            ScrollView(showsIndicators: false) {
                
                LazyVStack {
                    
                    ForEach( 0...10, id:\.self) { twitter in
                    
                        ThreadCellView()
                    }
                }
            }
            .refreshable {
                print("DEBUG: Refresh Threads")
            }
            .navigationTitle("Twitte")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(.black)
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
