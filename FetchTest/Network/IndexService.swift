//
//  IndexService
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

class IndexService {
    
    private var dataTask: URLSessionDataTask?
    
    func loadMeals(completion: @escaping(([SimpleMealModel]) -> Void)) {
        dataTask?.cancel()
        let url = URL(string: "\(baseURL)filter.php?c=Dessert")
        
        dataTask = URLSession.shared.dataTask(with: url!) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let mealResponse = try? JSONDecoder().decode(SimpleMealResponse.self, from: data) {
                completion(mealResponse.meals)
            }
        }
        dataTask?.resume()
    }
}
