//
//  LoginButtonView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI
import FirebaseAuth

struct LoginButtonView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var showAuthLoader: Bool
    @Binding var showInvalidPWAlert: Bool
    @Binding var isAuthenticated: Bool
    var buttonText: String
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Button(action: {
            showAuthLoader = true
            Task {
                if buttonText == "Sign In" {
                    await authViewModel.signInWithEmail(email: email, password: password)
                } else {
                    await authViewModel.signUp(email: email, password: password)
                }
                
                if authViewModel.state != .signedIn {
                    showInvalidPWAlert = true
                } else {
                    isAuthenticated = true
                }
                showAuthLoader = false
            }
        }) {
            Text(buttonText)
                .withButtonStyles()
                .disabled(email.isEmpty || password.isEmpty)
                .alert(isPresented: $showInvalidPWAlert) {
                    Alert(title: Text("Email or Password Incorrect"))
                }
        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(email: .constant(""),
                        password: .constant(""),
                        showAuthLoader: .constant(false),
                        showInvalidPWAlert: .constant(false),
                        isAuthenticated: .constant(false),
                        buttonText: "Sign In")
    }
}
