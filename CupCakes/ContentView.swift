//
//  ContentView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
