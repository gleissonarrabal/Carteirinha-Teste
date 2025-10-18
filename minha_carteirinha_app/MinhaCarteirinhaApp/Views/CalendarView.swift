import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack {
            Text("Outubro de 2025")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Spacer()

            VStack(alignment: .leading, spacing: 10) {
                Text("Marcações Importantes:")
                    .font(.headline)

                Text("20/10 - Prazo final para entrega de projeto X")
                    .font(.body)

                Text("25/10 - Início das provas finais")
                    .font(.body)

                Text("31/10 - Feriado de Halloween (sem aula)")
                    .font(.body)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Calendário")
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CalendarView()
        }
    }
}

