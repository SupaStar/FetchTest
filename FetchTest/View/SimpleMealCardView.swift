//
//  SimpleMealCardView
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

struct SimpleMealCardView: View {
    // MARK: PROPERTIES
    let simpleMeal: SimpleMealViewModel
    // MARK: BODY
    var body: some View {
        VStack {
            ImageView(url: simpleMeal.strMealThumb, width: 100.0, height: 100.0)
            Text("\(simpleMeal.truncatedTitle)")
                .font(.title2)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.top, 5)
        }
        .frame(width: 150, height: 150)
    }
}

struct SimpleMealCardView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleMealCardView(simpleMeal: sampleMealSimple())
            .previewLayout(.sizeThatFits)
    }
}
