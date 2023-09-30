//
//  CupCakesApp.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI
import Firebase

@main
struct CupCakesApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var shoppingCart = ShoppingCart()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .environmentObject(shoppingCart)
        }
    }
}
