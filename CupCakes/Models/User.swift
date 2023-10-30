//
//  User.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

struct User: Identifiable {
    var id: String
    var itemQuantity: Int
    var cupcakeName: String
    
    init(itemQuantity: Int, cupcakeName: String) {
        self.id = UUID().uuidString
        self.itemQuantity = itemQuantity
        self.cupcakeName = cupcakeName
    }
}
