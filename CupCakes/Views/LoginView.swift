//
//  LoginView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAuthLoader: Bool = false
    @State private var showInvalidPWAlert: Bool = false
    @State private var isAuthenticated: Bool = false
    @FocusState private var emailIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var shoppingCart: ShoppingCart
    var body: some View {
        VStack {
            NavigationLink("", value: isAuthenticated)
            TextField("Email", text: $email)
                .withLoginStyles()
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .submitLabel(.next)
                .focused($emailIsFocused)
            SecureField("Senha", text: $password)
                .withSecureFieldStyles()
                .submitLabel(.next)
                .focused($passwordIsFocused)
            if (!showAuthLoader) {
                // Sign In
                LoginButtonView(email: $email,
                                password: $password,
                                showAuthLoader: $showAuthLoader,
                                showInvalidPWAlert: $showInvalidPWAlert,
                                isAuthenticated: $isAuthenticated,
                                buttonText: "Sign In")
                // Create Account
                LoginButtonView(email: $email,
                                password: $password,
                                showAuthLoader: $showAuthLoader,
                                showInvalidPWAlert: $showInvalidPWAlert,
                                isAuthenticated: $isAuthenticated,
                                buttonText: "Create Account")
            } else {
                ProgressView()
            }
        }
        .padding()
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(for: Bool.self) { isAuth in
            if isAuth {
                HomeView()
            }
        }
        
        Spacer()
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
