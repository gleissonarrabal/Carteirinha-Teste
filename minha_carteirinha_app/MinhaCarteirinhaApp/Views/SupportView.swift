import SwiftUI

struct SupportView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Suporte")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)

            Text("Se você tiver alguma dúvida ou precisar de assistência, entre em contato conosco:")
                .font(.body)

            Text("E-mail: suporte@universidadealfa.com")
                .font(.headline)
                .foregroundColor(Color("AccentColor"))

            Spacer()
        }
        .padding()
        .navigationTitle("Suporte")
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SupportView()
        }
    }
}

