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
            ImageView(url: simpleMeal.strMealThumb)
            Text("\(simpleMeal.strMeal)")
                .foregroundColor(.black)
        }
    }
}

struct SimpleMealCardView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleMealCardView(simpleMeal: sampleMealSimple())
    }
}
