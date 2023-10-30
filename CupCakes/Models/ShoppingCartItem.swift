//
//  ShoppingCartItem.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

/// Carrinho
struct ShoppingCartItem: Identifiable {
   var id: String
   var cupcake: Cupcake
   var itemQuantity: Int
    
init(cupcake: Cupcake, itemQuantity: Int) {
   self.id = UUID().uuidString
   self.cupcake = cupcake
   self.itemQuantity = itemQuantity
}}
