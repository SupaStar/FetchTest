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
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
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
