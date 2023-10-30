//
//  CheckoutView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 21/10/23.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack {
            Text("Seu pedido foi processado com Sucesso!")
            Spacer()
            Text("Você pode retirá-lo no endereço:")
            Text("Rua das Bromélias, 55")
            Spacer()
            Text("Obrigada pela compra!")
        }
    }
}

#Preview {
    CheckoutView()
}
