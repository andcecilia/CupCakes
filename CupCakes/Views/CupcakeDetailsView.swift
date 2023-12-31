//
//  CupcakeDetailsView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 23/09/23.
//

import SwiftUI

struct CupcakeDetailsView: View {
    var cupcake: Cupcake
    @State private var count: Int = 1
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var body: some View {
        VStack {
            Image(cupcake.image)
            Text(cupcake.name)
            Text("Descrição: \(cupcake.description)")
            Spacer()
            Text("Preço por unidade: R$ \(cupcake.price)")
            
            Spacer()
            Stepper("Quantidade: \(count)", value: $count, in: 1...cupcake.quantity)

            Button(action: { shoppingCart.addProduct(cupcake: cupcake, 
                                                     itemQuantity: count) }
            ){
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
