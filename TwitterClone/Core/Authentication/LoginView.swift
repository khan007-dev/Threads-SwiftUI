//
//  LoginView.swift
//  TwitterClone
//
//  Created by Khan on 28.02.2024.
//

import SwiftUI

struct LoginView: View {
    
   
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        
        NavigationStack{
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
                    SecureField("Enter Your Password", text:  $viewModel.password)
                        .modifier(TextFieldModifedFile())
                    
                
                }
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                
                Button(action: {
                            
                    Task
                    {
                        try await viewModel.login()
                    }
                }, label: {
                    Text("Login")
                        .modifier(ButtonModifedFile())
                })
                
                Spacer()
                Divider()
                
                NavigationLink {
                   RegistartionView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack (spacing: 3) {
                        Text("Don't have an account")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }.foregroundStyle(.black)
                    .font(.footnote)
                }.padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
