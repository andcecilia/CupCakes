//
//  UserViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ShoppingCart: ObservableObject {
    @Published var shoppingCartItems: [ShoppingCartItem]
    private var userItems = [User]()
    private var user: User?
    private var userItemQuantity = 0
    
    init() {
        self.shoppingCartItems = []
    }
    
    // Adiciona o cupcake no carrinho e a quantidade que vem do stepper
    func addProduct(cupcake: Cupcake, itemQuantity: Int){
       var addNewProduct = true
       for (index, item) in shoppingCartItems.enumerated() {
           // se o nome do cupcake ja existe, soma a quantidade que vem do stepper
          if item.cupcake.name == cupcake.name {
              shoppingCartItems[index].itemQuantity = shoppingCartItems[index].itemQuantity + itemQuantity
              userItemQuantity = userItemQuantity + shoppingCartItems[index].itemQuantity
              self.updateUserShoppingCart(shoppingCartItem: shoppingCartItems[index], itemQuantity: userItemQuantity)
             addNewProduct = false
          }
       }
        // se o cupcake não existe, cria um item do ShoppingCartItem
       if addNewProduct {
           shoppingCartItems.append(ShoppingCartItem(cupcake: cupcake, itemQuantity: itemQuantity))
           userItemQuantity = userItemQuantity + itemQuantity
           self.updateUserShoppingCart(shoppingCartItem: ShoppingCartItem(cupcake: cupcake, itemQuantity: itemQuantity), itemQuantity: userItemQuantity)
       }
    }
    
    // atualiza os valores do cupcake no firebase
    func updateCupcakes(cupcakes: ShoppingCartItem) {
        do {
            let data: [String: Any] = [
                "description": cupcakes.cupcake.description,
                "image": cupcakes.cupcake.image,
                "name": cupcakes.cupcake.name,
                "price": cupcakes.cupcake.price,
                "quantity": cupcakes.cupcake.quantity - cupcakes.itemQuantity // Firebase - Carrinho
            ]
            try Firestore.firestore().collection("cupcakes").document(cupcakes.cupcake.id).setData(data)
        }
        catch {
            print(error)
        }
    }
    
    // atualiza os dados do usuário no Firebase
    func updateUserShoppingCart(shoppingCartItem: ShoppingCartItem, itemQuantity: Int) {
        let userData: [String: Any] = [
            "itemQuantity": itemQuantity,
            "cupcakeName" : shoppingCartItem.cupcake.name
        ]
        Firestore.firestore().collection("User").document(Auth.auth().currentUser!.uid).collection("cupcakes").document(shoppingCartItem.cupcake.id).setData(userData)
    }
    
    func getUserShoppingCart() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("User").document(userID).collection("cupcakes").getDocuments() { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.userItems = querySnapshot?.documents.compactMap { document -> User? in
                let data = document.data()
                
                guard let itemQuantity = data["itemQuantity"] as? Int,
                      let cupcakeName = data["cupcakeName"] as? String
                else {
                    return nil
                }
                
                for user in self.userItems {
                    self.userItemQuantity = user.itemQuantity
                }
                        
                return User(itemQuantity: itemQuantity, cupcakeName: cupcakeName)
            } ?? []
        }
        
    }
    
}


