//
//  ImageView
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

struct ImageView: View {
    // MARK: PROPERTIES
    let url: String
    let width: Double
    let height: Double
    // MARK: BODY
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
            case .empty:
                ProgressView()
                Text("Cargando")
            case .failure(_):
                Text("Error al cargar la imagen")
            @unknown default:
                Text("Error desconocido")
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", width: 100.0, height: 100.0)
    }
}
