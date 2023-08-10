//
//  IngredientsView
//  FetchTest
//
//  Created by Obed Martinez on 10/08/23
//



import SwiftUI

struct IngredientsView: View {
    // MARK: PROPERTIES
    let meal: FullMealViewModel?
    let ingredientsExample = ["Ingredient 1", "Ingredient 2", "Ingredient 3", "Ingredient 4", "Ingredient 5"]
    let measuresExample = ["200ml", "60ml", "2", "1600g", "3 tsp"]
    // MARK: BODY
    var body: some View {
        GroupBox {
            DisclosureGroup("Ingredients:"){
                ForEach(0..<(meal?.strIngredients.count ?? ingredientsExample.count), id: \.self)
                { index in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Text("\(meal?.strIngredients[index].capitalized ?? ingredientsExample[index])")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.orange)
                            .font(Font.system(.body).bold())
                        Spacer()
                        Text("\(meal?.strMeasures[index] ?? measuresExample[index])")
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal, 5)
                }//: FOR
            }
        }//: GROUP
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(meal: nil)
    }
}
