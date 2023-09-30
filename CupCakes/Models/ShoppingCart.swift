//
//  UserViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

class ShoppingCart: ObservableObject {
    @Published var shoppingCartItems: [ShoppingCartItem]
    var subTotal = 0
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
}


