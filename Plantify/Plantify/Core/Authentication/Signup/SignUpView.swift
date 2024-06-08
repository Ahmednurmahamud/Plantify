//
//  SignUpView.swift
//  Plantify
//
//  Created by Jinikho on 2024-02-26.
//

import SwiftUI

struct SignUpView: View {
    
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @Environment(AuthViewModel.self) private var viewModel
    @State private var showPrivacyPolicyDetail = false
    
    var body: some View {
        //SignUp Form
        NavigationStack {
            VStack {
                //Login Illustration
                Image("signUpIllustartion")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.vertical, 32)
                //Login Form
                VStack(alignment: .leading, spacing: 24) {
                    InputView(
                        text: $fullName,
                        title: "Full Name",
                        placeHolder: "name")
                    .autocorrectionDisabled()
                    
                    InputView(
                        text: $email,
                        title: "Email Address",
                        placeHolder: "name@example.com")
                    .textInputAutocapitalization(.never)
                    
                    InputView(
                        text: $password,
                        title: "Password",
                        placeHolder: "Enter your password",
                        isSecureField: true)
                    
                    ZStack(alignment: .trailing) {
                        InputView(
                            text: $confirmPassword,
                            title: "Confirm Password",
                            placeHolder: "Re-enter your password",
                            isSecureField: true)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(uiColor: .systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(uiColor: .systemRed))
                            }
                        }
                    }
                }
                .padding(.top, 12)
                
                Button {
                    Task {
                        try await viewModel.createUser(withEmail: email,
                                                       password: password,
                                                        fullName: fullName)
                    }
                } label: {
                    HStack {
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .buttonStyle(.primaryGreen)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.7)
                Text("By signing up, you agree to the \(Text("Terms of services").underline()) and \(Text("Privacy Policy").underline()).")
                    .font(.caption).foregroundStyle(.gray)
                    .onTapGesture {
                        self.showPrivacyPolicyDetail = true
                    }
                    .sheet(isPresented: $showPrivacyPolicyDetail) {
                        PrivacyPolicyDetailView()
                    }
                           
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .foregroundStyle(.black)
                        Text("Sign In")
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

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && email.contains(".")
        && !fullName.isEmpty
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
    }
}


#Preview {
    SignUpView()
        .environment(AuthViewModel())
}
