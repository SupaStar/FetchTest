//
//  DetailMealView
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

struct DetailMealView: View {
    // MARK: PROPERTIES
    let mealId: String
    @ObservedObject var viewModel: DetailViewModel
    
    // MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                if let meal = viewModel.meal {
                    // MARK: Header
                    HeaderDetailView(meal: meal)
                    
                    // MARK: Ingredients
                    IngredientsView(meal: meal)
                        .padding(.vertical, 10)
                    // MARK: Instructions
                    InstructionsView(meal: meal)
                }
            }//: VSTACK
        }//: SCROLL
        .onAppear{
            viewModel.loadMeal(mealId: mealId)
        }
    }
}

struct DetailMealView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMealView(mealId: "53005", viewModel: DetailViewModel())
    }
}
