//
//  ContentView
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    @ObservedObject var viewModel: IndexViewModel
    // MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridMealLayout,alignment: .center, spacing: 10){
                    ForEach(viewModel.meals){ meal in
                        NavigationLink(
                            destination:
                                DetailMealView(
                                    mealId: meal.idMeal,
                                    viewModel: DetailViewModel()
                                )
                        ){
                            SimpleMealCardView(
                                simpleMeal: meal
                            )
                        }//: NAV
                    }//: FOR
                }//: GRID
            }//: SCROLL
        }//: NAV
        .onAppear(perform: viewModel.loadMeals)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: IndexViewModel())
    }
}
