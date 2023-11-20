//
//  Extensions.swift
//  CupCakes
//
//  Created by Cecilia Andrea Pesce on 13/09/23.
//

import SwiftUI

public extension TextField {
    func withLoginStyles() -> some View {
        self.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
            )
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding(.bottom, 20)
    }
}

public extension SecureField {
    func withSecureFieldStyles() -> some View {
        self.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 2)
            )
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding(.bottom, 20)
    }
}

public extension Text {
    func withButtonStyles() -> some View {
        self.foregroundColor(.white)
            .padding()
            .frame(width: 320, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            .font(.headline)
    }
}
