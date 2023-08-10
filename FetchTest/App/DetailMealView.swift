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
                // MARK: Header
                HeaderDetailView(meal: viewModel.meal)
                    .padding(.horizontal)
                // MARK: Ingredients
                IngredientsView(meal: viewModel.meal)
                    .padding(.vertical, 10)
                // MARK: Instructions
                InstructionsView(meal: viewModel.meal)
            }//: VSTACK
            .onAppear{
                viewModel.loadMeal(mealId: mealId)
            }
        }
    }
}

struct DetailMealView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMealView(mealId: "53005", viewModel: DetailViewModel())
    }
}
