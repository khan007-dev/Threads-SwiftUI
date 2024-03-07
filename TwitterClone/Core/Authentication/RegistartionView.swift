//
//  RegistartionView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct RegistartionView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
 
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image(.X)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                
                TextField ("Enter Your Email ", text: $viewModel.email)
                    .modifier(TextFieldModifedFile())
                    .autocapitalization(.none)
                SecureField("Enter Your Password", text: $viewModel.password)
                    .modifier(TextFieldModifedFile())
                
                TextField ("Enter Your Full Name ", text: $viewModel.fullName)
                    .modifier(TextFieldModifedFile())
                
                TextField ("Enter Your user Name ", text: $viewModel.userName)
                    .modifier(TextFieldModifedFile())
                
            }
            
            Button(action: {
                Task {
                    try await viewModel.createUser()
                }
        
            }, label: {
                Text("Sign Up")
                    .modifier(ButtonModifedFile())
            }).padding(.vertical)
            
            Spacer()
            
            Divider()
            
            
            Button(action: {
                dismiss()
            }, label: {
                HStack (spacing: 3) {
                    Text("Don't have an account")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            })
            .padding(.vertical, 16)
            
        }
    }
}

#Preview {
    RegistartionView()
}
