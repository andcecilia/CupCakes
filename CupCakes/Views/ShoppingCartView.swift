//
//  ShoppingCartView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 23/09/23.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct ShoppingCartView: View {
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    @State var presentingModal = false
    @State private var isToRemoveAll = false
    
    @ViewBuilder var body: some View {
        // (Rectangle().fill(Gradient(colors: [.white, .orange])))
        List {
            ForEach(shoppingCart.shoppingCartItems) { shopCart in
                HStack {
                    Text(shopCart.cupcake.name)
                    Spacer()
                    HStack {
                        Text("Qtde:\(shopCart.itemQuantity)")
                        Spacer()
                        Text("R$\(shopCart.cupcake.price * shopCart.itemQuantity),00")
                    }
                }
             } .onDelete(perform: self.deleteItem)
        } .scrollContentBackground(.hidden)
            .background(Rectangle().fill(Gradient(colors: [.orange, .white]))).edgesIgnoringSafeArea(.all)
            .toolbar() {
            EditButton()
        }
        
        VStack {
            let totalAmount = shoppingCart.shoppingCartItems.reduce(0, { $0 + $1.cupcake.price * $1.itemQuantity})
            Text("Total R$ \(totalAmount),00")
            Spacer()
            Button(action: {
                var shopItem: ShoppingCartItem
                for (index, _) in shoppingCart.shoppingCartItems.enumerated() {
                    shopItem = shoppingCart.shoppingCartItems[index]
                    //pegar a quantidade do firebase
                    //verificar se quantidade do carrinho > firebase
                    if shopItem.itemQuantity > shopItem.cupcake.quantity {
                        self.isToRemoveAll = false
                        print("muitoooo")
                    } else {
                        self.isToRemoveAll = true
                        shoppingCart.updateCupcakes(cupcakes: shopItem)
                        self.presentingModal = true
                    }
                }
                if isToRemoveAll {
                    shoppingCart.shoppingCartItems.removeAll()
                }
                
            }){

                RoundedButton(imageName: "cart.badge.plus", text: "Finalizar pedido")
            } .sheet(isPresented: $presentingModal) {
                CheckoutView()
            }
        } .onAppear() {
            shoppingCart.getUserShoppingCart()
        }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.shoppingCart.shoppingCartItems.remove(atOffsets: indexSet)
    }
}
