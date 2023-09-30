//
//  User.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

struct User: Identifiable {
    var id: ObjectIdentifier
    var email: String
    var shoppingCart: [ShoppingCart]
    var shippingAddress: [ShippingAddress]
}
