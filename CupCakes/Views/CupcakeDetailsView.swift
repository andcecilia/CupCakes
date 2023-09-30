//
//  CupcakeDetailsView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 23/09/23.
//

import SwiftUI

struct CupcakeDetailsView: View {
    var cupcakeImage: String
    var cupcakeName: String
    var description: String
    var price: Int
    var cupcakeQuantity: Int
    @State private var count: Int = 1
    @EnvironmentObject var shoppingCart: ShoppingCart
    @State var cupcake: Cupcake
    
    var body: some View {
        VStack {
            Image(cupcakeImage)
            Text(cupcakeName)
            Text("Descrição: \(description)")
            Spacer()
            Text("Preço por unidade: R$ \(price)")
            Spacer()
            Stepper("\(count)", value: $count, in: 1...cupcakeQuantity)
            Button(action: {shoppingCart.addProduct(cupcake: .init(name: cupcakeName,
                                                                   price: price,
                                                                   quantity: cupcakeQuantity,
                                                                   image: cupcakeImage,
                                                                   description: description), count: count)}){
                RoundedButton(imageName: "cart.badge.plus", text: "Add to Cart")
            }
        }
    }
}

struct RoundedButton: View {
   var imageName: String
   var text: String
   var body: some View {
   HStack {
      Image(systemName: imageName).font(.title)
      Text(text).fontWeight(.semibold).font(.title)
   }.padding().foregroundColor(.white).background(Color.orange)
.cornerRadius(40)
}}
