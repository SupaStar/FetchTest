//
//  SimpleMealModel
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

struct SimpleMealModel: Decodable {
    var idMeal: String
    var strMealThumb: String
    var strMeal: String
    
    enum CodingKeys: String, CodingKey {
        case idMeal = "idMeal"
        case strMealThumb = "strMealThumb"
        case strMeal = "strMeal"
    }
}

struct SimpleMealResponse: Decodable {
    var meals: [SimpleMealModel]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

class SimpleMealViewModel: Identifiable, ObservableObject {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
    
    var truncatedTitle: String {
        let maxLength = 20
        if strMeal.count >= maxLength {
            let truncatedText = self.strMeal.prefix(maxLength)
            return "\(truncatedText)..."
        }
        return self.strMeal
    }
    init(meal: SimpleMealModel) {
        self.idMeal = meal.idMeal
        self.strMealThumb = meal.strMealThumb
        self.strMeal = meal.strMeal
    }
}
