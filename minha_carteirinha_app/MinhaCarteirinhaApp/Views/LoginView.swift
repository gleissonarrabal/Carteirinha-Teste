import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()

                Image("UniversidadeAlfaLogo") // Usar o asset de logo gerado
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 20)

                Text("Universidade Alfa")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))

                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                Button(action: {
                    authenticateUser()
                }) {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarHidden(true) // Esconder a barra de navegação padrão
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erro de Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func authenticateUser() {
        // Validação mínima: e-mail e senha não podem ser vazios
        if email.isEmpty || password.isEmpty {
            alertMessage = "Por favor, preencha todos os campos."
            showAlert = true
            return
        }

        // Simulação de login bem-sucedido
        isLoggedIn = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

