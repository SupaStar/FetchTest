//
//  ImageView
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

struct ImageView: View {
    let width: Double
    let height: Double
    @StateObject private var imageLoader: ImageLoader
    private var placeholder: Image
    
    init(url: String, width: Double, height: Double, placeholder: Image = Image(systemName: "photo")) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
        self.height = height
        self.width = width
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
        } else {
            placeholder
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", width: 100.0, height: 100.0)
    }
}
