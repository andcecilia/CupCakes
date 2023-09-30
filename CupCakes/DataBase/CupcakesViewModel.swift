//
//  CupcakesViewModel.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 17/09/23.
//
//
//import Foundation
//import FirebaseFirestore
//
//class CupcakesViewModel: ObservableObject {
//  @Published var cupcakes = [Cupcake]()
//    private var db = Firestore.firestore()
//
//      func fetchData() {
//        db.collection("cupcakes").addSnapshotListener { (querySnapshot, error) in
//          guard let documents = querySnapshot?.documents else {
//            print("No documents")
//            return
//          }
//
//          self.cupcakes = documents.map { queryDocumentSnapshot -> Cupcake in
//            let data = queryDocumentSnapshot.data()
//            let name = data["name"] as? String ?? ""
//              let price = data["\(price)"] as? Int ?? 0
//            //let image = data["image"] as? String ?? ""
//
//            return Cupcake(id: .init(), name: name, price: price)
//          }
//        }
//      }
//}
