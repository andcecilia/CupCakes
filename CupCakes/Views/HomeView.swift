//
//  HomeView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI
import FirebaseFirestore

let testData = [
    Cupcake(name: "Banana",
            price: 10,
            quantity: 10,
            image: "banana",
           description: "Banana diretamente colhida de Joinville"),
    Cupcake(name: "Limão",
            price: 10,
            quantity: 20,
            image: "lemon",
           description: "Limão Siciliano"),
    Cupcake(name: "Chocolate",
            price: 12,
            quantity: 5,
            image: "chocolat",
            description: "Chocolate Belga")
]

//Firestore.firestore().collection("cupcakes").addSnapshotListener { (querySnapshot, error) in
//    guard let documents = querySnapshot?.documents else {
//        print("No documents")
//        return
//    }
//
//    documents.map { queryDocumentSnapshot -> Cupcake in
//        // map document to Book instance here
//    }
//}
    
struct HomeView: View {
      var cupcakes = testData
    @State private var cupcakeQuantity = 0
    @State private var cupcakeItem: Cupcake?
    @EnvironmentObject var shoppingCart: ShoppingCart

      // cupcakeQuantity != cupcake.quantity
      var body: some View {
        NavigationView {
            Form {
                ForEach(cupcakes) { cupcake in
                    VStack {
                        NavigationLink {
                            CupcakeDetailsView(cupcakeImage: cupcake.image,
                                               cupcakeName: cupcake.name,
                                               description: cupcake.description,
                                               price: cupcake.price,
                                               cupcakeQuantity: cupcake.quantity,
                                               cupcake: cupcakeItem ?? Cupcake(
                                               name: "Chocolate",
                                               price: 12,
                                               quantity: 5,
                                               image: "chocolat",
                                               description: "Chocolate Belga"))
                        } label: {
                            Text(cupcake.name)
                        }
//                        Stepper("\(cupcake.name)",
//                                value: $cupcakeQuantity,
//                                in: 0...cupcake.quantity)
//                        Text("Total: \(cupcakeQuantity) itens")
                    }
                }
                
            }
          
        }
        .navigationBarTitle("Cupcakes")
        .navigationBarItems(trailing:
                                NavigationLink(destination: ShoppingCartView()) {
            Image(systemName: "cart")
        })
//          Button {
//              withAnimation {
//                  //var action: () -> Void
//                  //TODO: Chamar tela de carrinho de compras
//              }
//          } label: {
//              VStack {
//                  Image(systemName: "bag")
//                      .resizable()
//                      .scaledToFit()
//                      .frame(width: 20)
//                      .padding()
//                      .background(.black)
//                      .foregroundColor(.white)
//                      .fontWeight(.bold)
//                      .mask(Circle())
//                  Text("Add to Cart")
////                      .font(.custom(AppFont.regularFont, size: 10))
////                      .foregroundColor(RCValues.shared
////                          .color(forKey: .primary))
//              }
//          }
      }
    }
