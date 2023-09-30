//
//  UserViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation
import FirebaseFirestore

class ShoppingCart: ObservableObject {
    @Published var shoppingCartItems: [ShoppingCartItem]
    
    init() {
        self.shoppingCartItems = []
    }
    
    func addProduct(cupcake: Cupcake, count: Int){
       var addNewProduct = true
       for (index, item) in shoppingCartItems.enumerated() {
          if item.cupcake.name == cupcake.name {
              shoppingCartItems[index].count = shoppingCartItems[index].count + count
             addNewProduct = false
          }
       }
       if addNewProduct {
           shoppingCartItems.append(ShoppingCartItem(cupcake: cupcake, count: count))
       }
    }
    
    func removeProduct(cupcake: Cupcake, count: Int) {
        for (index, item) in shoppingCartItems.enumerated() {
           if item.cupcake.name == cupcake.name {
               shoppingCartItems[index].count = shoppingCartItems[index].count - count
           }
        }
    }
    
    func updateCupcakes(cupcakes: ShoppingCartItem) {
        do {
            let data: [String: Any] = [
                "description": cupcakes.cupcake.description,
                "image": cupcakes.cupcake.image,
                "name": cupcakes.cupcake.name,
                "price": cupcakes.cupcake.price,
                "quantity": cupcakes.cupcake.quantity - cupcakes.count
            ]
            try Firestore.firestore().collection("cupcakes").document(cupcakes.cupcake.id).setData(data)
        }
        catch {
            print(error)
        }
    }
    
}


