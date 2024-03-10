//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = ExplorerViewModel()
    var body: some View {
      
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach ( viewModel.users) { user in
                    
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                    
                                Divider()
                            }
                            .padding(.vertical,4)
                        }
                        
                    }
                }
            }
            .navigationDestination(for: User.self, destination: {
                user in
                ProfileView()
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
