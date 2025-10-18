import SwiftUI
import CoreImage.CIFilterBuiltins

class IDCardViewModel: ObservableObject {
    @Published var studentName: String = "Gleisson Arrabal da Silva"
    @Published var studentRA: String = "2025A001234"
    @Published var studentCourse: String = "Sistemas de Informação"
    @Published var studentValidity: String = "12/2026"
    @Published var studentPhoto: UIImage? // Pode ser carregada localmente ou de um asset

    var qrCodeImage: UIImage? {
        generateQRCode(from: "RA:\(studentRA)|Nome:\(studentName)|Curso:\(studentCourse)")
    }

    init() {
        // Carregar dados salvos localmente, se existirem
        loadIDCardData()
    }

    func updateStudentPhoto(_ newPhoto: UIImage) {
        studentPhoto = newPhoto
        saveIDCardData() // Salvar a foto atualizada
    }

    private func generateQRCode(from string: String) -> UIImage? {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            // Escalar o QR Code para um tamanho maior e mais nítido
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledQrImage = outputImage.transformed(by: transform)

            if let cgimg = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return nil
    }

    func saveIDCardData() {
        // Implementar salvamento de dados da carteirinha (nome, RA, curso, validade, foto) usando UserDefaults ou JSON local
        // Por simplicidade, vamos salvar apenas a foto como Data no UserDefaults por enquanto.
        if let photo = studentPhoto, let imageData = photo.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "studentPhoto")
        }
        UserDefaults.standard.set(studentName, forKey: "studentName")
        UserDefaults.standard.set(studentRA, forKey: "studentRA")
        UserDefaults.standard.set(studentCourse, forKey: "studentCourse")
        UserDefaults.standard.set(studentValidity, forKey: "studentValidity")
    }

    func loadIDCardData() {
        // Carregar dados salvos localmente
        if let savedPhotoData = UserDefaults.standard.data(forKey: "studentPhoto") {
            studentPhoto = UIImage(data: savedPhotoData)
        }
        studentName = UserDefaults.standard.string(forKey: "studentName") ?? "Gleisson Arrabal da Silva"
        studentRA = UserDefaults.standard.string(forKey: "studentRA") ?? "2025A001234"
        studentCourse = UserDefaults.standard.string(forKey: "studentCourse") ?? "Sistemas de Informação"
        studentValidity = UserDefaults.standard.string(forKey: "studentValidity") ?? "12/2026"
    }
}

