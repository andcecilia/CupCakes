//
//  ContentView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var hasdSignedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some View {
        VStack {
            NavigationStack {
                if authViewModel.state == .logout && !hasdSignedIn {
                    LoginView()
                } else {
                    HomeView()
                }
            }
        }
        .padding()
    }
}

