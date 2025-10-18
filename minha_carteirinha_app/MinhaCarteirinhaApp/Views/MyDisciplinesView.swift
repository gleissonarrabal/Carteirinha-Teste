import SwiftUI

struct MyDisciplinesView: View {
    let disciplines = [
        "Programação Mobile",
        "Estrutura de Dados",
        "Banco de Dados",
        "Engenharia de Software",
        "Redes de Computadores"
    ]

    var body: some View {
        List(disciplines, id: \.self) {
            discipline in
            Text(discipline)
                .font(.headline)
                .padding(.vertical, 5)
        }
        .navigationTitle("Minhas Disciplinas")
    }
}

struct MyDisciplinesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyDisciplinesView()
        }
    }
}

