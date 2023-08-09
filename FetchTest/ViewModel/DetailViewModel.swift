//
//  DetailViewModel
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

class DetailViewModel: ObservableObject {
    @Published public private(set) var meal: FullMealViewModel?

    private let dataModel: DetailMealService = DetailMealService()
    
    func loadMeal(mealId: String){
        meal = nil
        dataModel.loadDetailMeal(mealID: mealId, completion: { meals in
            if let mealR = meals.first {
                let fullMealViewModel = FullMealViewModel(meal: mealR)
                DispatchQueue.main.async {
                    self.meal = fullMealViewModel
                }
            }
        })
    }
}
