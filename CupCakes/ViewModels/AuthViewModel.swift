//
//  AuthViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import Firebase
import AuthenticationServices

class AuthViewModel: NSObject, ObservableObject {
    enum SignInState {
        case signedIn
        case logout
    }
    
    @Published var state: SignInState = .logout
    @Published var errorMessage: String = ""
    
    
    // MARK: - Login com email
    
    @MainActor
    func signInWithEmail(email: String, password: String) async {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            self.state = .signedIn
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }
        catch {
            debugPrint(error.localizedDescription)
            self.errorMessage = error.localizedDescription
        }
    }
    
    
    // MARK: - Registrar com email
    
    @MainActor
    func signUp(email: String, password: String) async {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            self.state = .signedIn
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }
        catch {
            debugPrint(error.localizedDescription)
            self.errorMessage = error.localizedDescription
        }
    }
    
    
    // MARK: - Logout
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.state = .logout
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
