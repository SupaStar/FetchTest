//
//  HeaderDetailView
//  FetchTest
//
//  Created by Obed Martinez on 10/08/23
//



import SwiftUI

struct HeaderDetailView: View {
    // MARK: PROPERTIES
    let meal: FullMealViewModel?
    // MARK: BODY
    var body: some View {
        HStack(alignment: .center, content: {
            VStack(alignment:.leading, spacing: 10, content: {
                Text("\(meal?.strMeal ?? "Pruebota")")
                    .font(.title)
                Text("\(meal?.strCategory ?? "Prueba")")
                    .font(.title3)
                Text("\(meal?.strArea ?? "Area")")
                    .font(.callout)
            })//: VSTACK
            Spacer()
            ImageView(url: meal?.strMealThumb ?? "", width: 160.0, height: 160.0)
        })//: HSTACK
        .padding()
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView(meal: nil)
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}
