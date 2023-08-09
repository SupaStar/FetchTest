//
//  DetailMealService
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

class DetailMealService {
    
    private var dataTask: URLSessionDataTask?

    func loadDetailMeal(mealID: String, completion: @escaping(([FullMealModel]) -> Void)) {
        dataTask?.cancel()
        let url = URL(string: "\(baseURL)lookup.php?i=\(mealID)")
        
        dataTask = URLSession.shared.dataTask(with: url!) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let mealResponse = try? JSONDecoder().decode(MealResponse.self, from: data) {
                completion(mealResponse.meals)
            }
        }
        dataTask?.resume()
    }
}
