//
//  HomeView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct HomeView: View {
    @State private var cupcakes = [Cupcake]()
    @State private var cupcakeItem: Cupcake?
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    ForEach(cupcakes) { cupcake in
                        if cupcake.quantity != 0 {
                            VStack {
                                NavigationLink {
                                    CupcakeDetailsView(cupcake: cupcake)
                                } label: {
                                    Text(cupcake.name)
                                }
                            }
                        }
                    }
                }.scrollContentBackground(.hidden)
                    .onAppear {
                        fetchProducts()
                    } 
                    .navigationBarTitle("Cupcakes").background(Rectangle().fill(Gradient(colors: [.white, .orange])))
                    .navigationBarItems(trailing: NavigationLink(destination: ShoppingCartView()) { Image(systemName: "cart")
                    })
            }
        }
    }
    
    private func fetchProducts() {
        Firestore.firestore().collection("cupcakes").getDocuments() { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.cupcakes = querySnapshot?.documents.compactMap { document -> Cupcake? in
                let data = document.data()
                
                guard let name = data["name"] as? String,
                      let price = data["price"] as? Int,
                      let quantity = data["quantity"] as? Int,
                      let image = data["image"] as? String,
                      let description = data["description"] as? String
                else {
                    return nil
                }
                
                return Cupcake(id: document.documentID,
                               name: name,
                               price: price,
                               quantity: quantity,
                               image: image,
                               description: description)
            } ?? []
        }
    }
}

