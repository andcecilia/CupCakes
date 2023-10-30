//
//  CupcakeViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation
import SwiftUI

/// Informações que vem do Firebase
class Cupcake: Identifiable {
    var id: String // Imutável
    var name: String // Imutável
    var price: Int // Imutável
    var quantity: Int // Mutável - Estoque
    var image: String // Imutável
    var description: String // Imutável
    
    init(id: String,
         name: String,
         price: Int,
         quantity: Int,
         image: String,
         description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
        self.image = image
        self.description = description
    }
}
