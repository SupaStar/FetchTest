//
//  IndexViewModel
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

class IndexViewModel: ObservableObject {
    @Published public private(set) var meals: [SimpleMealViewModel] = []

    private let dataModel: IndexService = IndexService()

    func loadMeals() {
        meals.removeAll()
        dataModel.loadMeals(completion: { meals in
            meals.forEach{self.appendMeal(meal:$0)}
        })
    }
    private func appendMeal(meal: SimpleMealModel) {
        let mealViewModel = SimpleMealViewModel(meal: meal)
        DispatchQueue.main.async {
          self.meals.append(mealViewModel)
        }
    }
}

