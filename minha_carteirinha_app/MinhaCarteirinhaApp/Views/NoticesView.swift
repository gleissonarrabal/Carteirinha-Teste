import SwiftUI

struct NoticesView: View {
    let notices = [
        "Atenção: Matrículas para o próximo semestre abrem em 01/03/2026.",
        "Lembrete: Evento de carreira no dia 20/11/2025 no auditório principal.",
        "Comunicado: Biblioteca terá horário especial de funcionamento na próxima semana."
    ]

    var body: some View {
        List(notices, id: \.self) {
            notice in
            Text(notice)
                .font(.body)
                .padding(.vertical, 5)
        }
        .navigationTitle("Avisos")
    }
}

struct NoticesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoticesView()
        }
    }
}

