//
//  LoginView.swift
//  CleanArchitecture-SwiftUI
//
//  Created by Adis Mulabdic on 23.03.2022..
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Login Form").bold()
                .padding(32)
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 10)
            Button("Login") {
                viewModel.login()
            }
            .foregroundColor(.black)
            .buttonStyle(.bordered)
        }
        .overlay(ProgressView()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .opacity(viewModel.isLoading ? 1 : 0))
        .padding(.horizontal, 24)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
