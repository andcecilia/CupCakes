import FirebaseAuth
import SwiftUI


struct ResetPasswordView: View {
    @State private var email: String = ""
    @State var showConfirmationAlert: Bool = false
    @FocusState private var emailIsFocused: Bool
    
    var body: some View {
        Spacer()
        VStack {
            TextField("Email", text: $email, prompt: Text("Digite seu e-mail"))
                .withLoginStyles()
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .submitLabel(.next)
                .focused($emailIsFocused)
            Button(action: { self.resetPassword(email: email, resetCompletion: {_ in
                self.showConfirmationAlert = true
            }) }, label: { Text("Enviar")
                    .alert(isPresented: $showConfirmationAlert) {
                        Alert(title: Text("Reset de senha feito com sucesso. Verifique seu e-mail."))
                    }
            })
        }
        Spacer()
    }
    
    private func resetPassword(email: String, resetCompletion: @escaping (Result<Bool, Error>) -> Void ) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            if let error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        })
    }
}

//#Preview {
//    ResetPasswordView()
//}
