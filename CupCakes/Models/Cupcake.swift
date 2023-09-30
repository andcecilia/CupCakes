//
//  CupcakeViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation
import SwiftUI

class Cupcake: Identifiable {
    var name: String
    var price: Int
    var quantity: Int
    var image: String
    var description: String
    
    init(name: String,
         price: Int,
         quantity: Int,
         image: String,
         description: String) {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.image = image
        self.description = description
    }
}
