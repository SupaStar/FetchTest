//
//  ImageLoader
//  FetchTest
//
//  Created by Obed Martinez on 10/08/23
//



import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var url: String
    private static var cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        if let cacheDirectoryURL = urls.first {
            return cacheDirectoryURL
        }
        fatalError("Unable to access cache directory")
    }()
    
    init(url: String) {
        self.url = url
        if let cachedImage = ImageLoader.loadImageFromCacheDirectory(url: url) {
            self.image = cachedImage
        } else {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                ImageLoader.saveImageToCacheDirectory(image: loadedImage, url: self.url)
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
    
    private static func loadImageFromCacheDirectory(url: String) -> UIImage? {
            let imageURL = URL(string: url)!
            let fileURL = cacheDirectory.appendingPathComponent(imageURL.lastPathComponent)
            if let data = try? Data(contentsOf: fileURL),
               let image = UIImage(data: data) {
                return image
            }
            return nil
        }

        private static func saveImageToCacheDirectory(image: UIImage, url: String) {
            let imageURL = URL(string: url)!
            let fileURL = cacheDirectory.appendingPathComponent(imageURL.lastPathComponent)
            if let data = image.jpegData(compressionQuality: 0.8) {
                do {
                    try data.write(to: fileURL)
                } catch {
                    print("Error saving image to cache directory: \(error)")
                }
            }
        }
}
