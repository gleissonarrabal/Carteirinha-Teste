import SwiftUI

struct QRCodeFullScreenView: View {
    let qrCodeImage: UIImage

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Image(uiImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("QR Code")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QRCodeFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        // Exemplo de QR Code para preview
        let exampleQRCode = generateExampleQRCode(from: "Exemplo de QR Code")
        QRCodeFullScreenView(qrCodeImage: exampleQRCode)
    }

    static func generateExampleQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledQrImage = outputImage.transformed(by: transform)

            if let cgimg = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage() // Retorna uma imagem vazia em caso de falha
    }
}

