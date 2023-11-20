//
//  CheckoutView.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 21/10/23.
//

import SwiftUI

struct CheckoutView: View {
        init() {
            UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        }
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Você pode retirá-los no endereço:")
                Text("Rua das Bromélias, 55")
                Spacer().frame(height: 10)
                Text("Obrigada pela compra!").font(.system(size: 30).bold())
                    .foregroundColor(.brown)
                    .position(x: 200, y: 200)
                Rectangle()
                    .fill(Gradient(colors: [.white, .orange]))
                    .edgesIgnoringSafeArea(.all)
            }.navigationTitle(Text("Seu pedido foi processado com Sucesso!"))
        }
    }
}

#Preview {
    CheckoutView()
}
