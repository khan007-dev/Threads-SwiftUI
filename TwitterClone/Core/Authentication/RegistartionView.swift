//
//  RegistartionView.swift
//  TwitterClone
//
//  Created by Khan on 29.02.2024.
//

import SwiftUI

struct RegistartionView: View {
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                
                TextField ("Enter Your Email ", text: $email)
                    .modifier(TextFieldModifedFile())
                    .autocapitalization(.none)
                SecureField("Enter Your Password", text: $password)
                    .modifier(TextFieldModifedFile())
                
                TextField ("Enter Your Full Name ", text: $fullName)
                    .modifier(TextFieldModifedFile())
                
                TextField ("Enter Your user Name ", text: $userName)
                    .modifier(TextFieldModifedFile())
                
            }
            
            Button(action: {
                
                
            }, label: {
                Text("Sign Up")
                    .modifier(ButtonModifedFile())
            }).padding(.vertical)
            
            Spacer()
            
            Divider()
            
            
            Button(action: {
                
            }, label: {
                HStack (spacing: 3) {
                    Text("Don't have an account")
                    Text("Sign In")
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
