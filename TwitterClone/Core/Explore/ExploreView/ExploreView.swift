//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    var body: some View {
      
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach ( 0...10, id: \.self) { user in
                    
                        VStack {
                        
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical,4)
                       
                        
                    }
                }
            }.navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
