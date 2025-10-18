import UIKit

class ImageSaver: NSObject {
    private var completion: ((Bool, Error?) -> Void)?

    func saveImage(_ image: UIImage, completion: ((Bool, Error?) -> Void)? = nil) {
        self.completion = completion
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("Save error: \(error.localizedDescription)")
            completion?(false, error)
        } else {
            print("Save finished!")
            completion?(true, nil)
        }
    }
}

