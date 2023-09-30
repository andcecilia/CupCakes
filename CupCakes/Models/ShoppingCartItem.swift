//
//  ShoppingCartItem.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

struct ShoppingCartItem: Identifiable {
   var id: String
   var cupcake: Cupcake
   var count: Int
init(cupcake: Cupcake, count: Int) {
   self.id = UUID().uuidString
   self.cupcake = cupcake
   self.count = count
}}
