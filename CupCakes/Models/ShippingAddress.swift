//
//  ShippingAddress.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation

struct ShippingAddress: Identifiable {
    var id: ObjectIdentifier
    var streetNumber: String
    var streetName: String
    var postalCode: String
    var town: String
}
