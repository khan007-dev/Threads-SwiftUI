//
//  ContentView.swift
//  TwitterClone
//
//  Created by Khan on 28.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
       
        Group {
            if viewModel.userSession != nil {
                TwitterTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
