import SwiftUI
import CoreImage.CIFilterBuiltins

struct MyIDCardView: View {
    @StateObject private var viewModel = IDCardViewModel()
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage? // Para a foto selecionada
    @State private var showingQRCodeFullScreen = false
    @State private var showingSaveAlert = false
    @State private var saveAlertMessage = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Minha Carteirinha")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(.top)

                // Cartão da Carteirinha
                IDCardContent(viewModel: viewModel)
                    .padding(.horizontal)
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .padding(.horizontal)

                // Botões de Ação
                Button(action: {
                    if let qrCode = viewModel.qrCodeImage {
                        showingQRCodeFullScreen = true
                    }
                }) {
                    Text("Mostrar QR em tela cheia")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .sheet(isPresented: $showingQRCodeFullScreen) {
                    if let qrCode = viewModel.qrCodeImage {
                        QRCodeFullScreenView(qrCodeImage: qrCode)
                    }
                }

                Button(action: {
                    saveIDCardAsImage()
                }) {
                    Text("Salvar carteirinha como imagem")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .alert(isPresented: $showingSaveAlert) {
                    Alert(title: Text("Salvar Imagem"), message: Text(saveAlertMessage), dismissButton: .default(Text("OK")))
                }

                Button(action: {
                    showingImagePicker = true
                }) {
                    Text("Atualizar Foto")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("AccentColor"))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { newImage in
            if let newImage = newImage {
                viewModel.updateStudentPhoto(newImage)
            }
        }
    }

    func saveIDCardAsImage() {
        let viewToRender = IDCardContent(viewModel: viewModel)
            .padding(20) // Adicionar padding para o conteúdo do cartão
            .background(Color(.systemBackground))
            .cornerRadius(15)

        if let image = viewToRender.asUIImage() {
            ImageSaver().saveImage(image) { success, error in
                if success {
                    saveAlertMessage = "Carteirinha salva com sucesso na sua galeria de fotos!"
                } else if let error = error {
                    saveAlertMessage = "Erro ao salvar carteirinha: \(error.localizedDescription)"
                } else {
                    saveAlertMessage = "Erro desconhecido ao salvar carteirinha."
                }
                showingSaveAlert = true
            }
        } else {
            saveAlertMessage = "Não foi possível gerar a imagem da carteirinha."
            showingSaveAlert = true
        }
    }
}

// Sub-view para o conteúdo da carteirinha, para ser reutilizada para renderização em imagem
struct IDCardContent: View {
    @ObservedObject var viewModel: IDCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                if let photo = viewModel.studentPhoto {
                    Image(uiImage: photo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("AccentColor"), lineWidth: 2))
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.bottom, 10)

            Text("Nome: **\(viewModel.studentName)**")
                .font(.title2)
            Text("RA: **\(viewModel.studentRA)**")
                .font(.title3)
            Text("Curso: **\(viewModel.studentCourse)**")
                .font(.title3)
            Text("Validade: **\(viewModel.studentValidity)**")
                .font(.title3)

            // QR Code
            if let qrCodeImage = viewModel.qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

// Extensão para renderizar uma View SwiftUI em UIImage
extension View {
    func asUIImage() -> UIImage? {
        let controller = UIHostingController(rootView: self)
        controller.view.frame = CGRect(x: 0, y: 0, width: 400, height: 600) // Tamanho arbitrário, ajustar conforme necessário
        controller.view.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(bounds: controller.view.bounds)
        return renderer.image { _ in
            controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

struct MyIDCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyIDCardView()
    }
}

