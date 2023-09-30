//
//  ShoppingCartView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 23/09/23.
//

import SwiftUI

struct ShoppingCartView: View {
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    @ViewBuilder var body: some View {
        List {
            ForEach(shoppingCart.shoppingCartItems) { shopCart in
//            shoppingCart.shoppingCartItems.forEach { shopCart in
//                let totalAmount = shoppingCart.shoppingCartItems.reduce(0, { $0 + $1.cupcake.price * $1.count})
//                let _ = print(totalAmount)
//                self.total = shoppingCart.shoppingCartItems.reduce(0, { $0 + $1.cupcake.price * $1.count})
                HStack {
                    Text(shopCart.cupcake.name)
                    Spacer()
                    Text("Qtde:\(shopCart.count)")
                    Spacer()
                    Text("R$\(shopCart.cupcake.price * shopCart.count),00")
                }
             } .onDelete(perform: self.deleteItem)
        } .toolbar() {
            EditButton()
        }
        
        VStack {
            let totalAmount = shoppingCart.shoppingCartItems.reduce(0, { $0 + $1.cupcake.price * $1.count})
            Text("Total R$ \(totalAmount)")
            Spacer()
            Button(action: {}){
                RoundedButton(imageName: "cart", text: "Finalizar Compra")
            }
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.shoppingCart.shoppingCartItems.remove(atOffsets: indexSet)
    }
}

//#Preview {
//    ShoppingCartView()
//}