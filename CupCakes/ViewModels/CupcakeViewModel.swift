//
//  CupcakeViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

struct Cupcake: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var price: Double
    //var imageName: String
}
