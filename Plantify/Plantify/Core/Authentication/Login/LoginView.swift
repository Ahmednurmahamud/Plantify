//
//  LoginView.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-26.
//

import SwiftUI

struct LoginView: View {


    
    @State private var email = ""
    @State private var password = ""
    @Environment(AuthViewModel.self) private var viewModel
    
    var body: some View {
        
        NavigationStack {
            VStack {
                //Login Illustration
                Image("loginIllustration")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.vertical, 32)
                
                //Login Form
                VStack(alignment: .leading, spacing: 24) {
                    InputView(
                        text: $email,
                        title: "Email Address",
                        placeHolder: "name@example.com")
                    .textInputAutocapitalization(.never)
                    .padding(16)
                    .foregroundColor(.black)
                    .roundedBackground(cornerRadius: 14, color: Color(red: 0.9, green: 0.9, blue: 0.9))
                    
                    InputView(
                        text: $password,
                        title: "Password",
                        placeHolder: "Enter your password",
                        isSecureField: true)
                    .padding(16)
                    .foregroundColor(.black)
                    .roundedBackground(cornerRadius: 14, color: Color(red: 0.9, green: 0.9, blue: 0.9))
                }
                .padding(.top, 12)
                
                //SignIn Button
                Button {
                    Task {
                        try await viewModel.signIn(withEmail:email,
                                                   password: password)
                    }
                } label: {
                    HStack {
                        Text("Login")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .buttonStyle(.primaryGreen)
                //.padding(.top, 16)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                Spacer()
                
                HStack(spacing: 8) {
                    Text("Create an account")
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Sign Up")
                            .underline().fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.25, green: 0.53, blue: 0.34))
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

//MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
        .environment(AuthViewModel())
}
