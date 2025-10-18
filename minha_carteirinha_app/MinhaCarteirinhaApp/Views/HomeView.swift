import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Bem-vindo(a) à Universidade Alfa!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color("PrimaryColor"))

                    // Card para MINHA CARTEIRINHA
                    NavigationLink(destination: MyIDCardView()) {
                        HomeCard(title: "Minha Carteirinha", icon: "person.crop.rectangle.fill")
                    }

                    // Card para Minhas Disciplinas
                    NavigationLink(destination: MyDisciplinesView()) {
                        HomeCard(title: "Minhas Disciplinas", icon: "book.closed.fill")
                    }

                    // Card para Avisos
                    NavigationLink(destination: NoticesView()) {
                        HomeCard(title: "Avisos", icon: "bell.fill")
                    }

                    // Card para Calendário
                    NavigationLink(destination: CalendarView()) {
                        HomeCard(title: "Calendário", icon: "calendar")
                    }

                    // Card para Suporte
                    NavigationLink(destination: SupportView()) {
                        HomeCard(title: "Suporte", icon: "questionmark.circle.fill")
                    }
                }
                .padding()
            }
            .navigationTitle("Início")
            .navigationBarHidden(true) // Esconder a barra de navegação padrão
        }
    }
}

struct HomeCard: View {
    let title: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color("AccentColor"))
                .frame(width: 50)
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color("PrimaryColor"))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

