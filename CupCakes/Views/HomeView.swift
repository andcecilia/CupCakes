//
//  HomeView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI

let testData = [
    Cupcake(name: "Banana", price: 9.90),
    Cupcake(name: "Limão", price: 9.90),
    Cupcake(name: "Chocolate", price: 12.90),
]

struct HomeView: View {
      var cupcakes = testData
      
      var body: some View {
        NavigationView {
          List(cupcakes) { cupcake in
            VStack(alignment: .leading) {
                Text(cupcake.name)
                .font(.headline)
                Text("\(cupcake.price, specifier: "%.2f")")
                .font(.subheadline)
            }
          }
          .navigationBarTitle("Cupcakes")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
