//
//  FullMealModel
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation

struct FullMealModel: Decodable {
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
    var strCategory: String
    var strArea: String
    var strInstructions: String
    var strDrinkAlternate: String?
    var strTags: String?
    var strYoutube: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    var strIngredients: [String]
    var strMeasures: [String]
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strMealThumb, strCategory, strArea, strInstructions, strDrinkAlternate, strTags, strYoutube, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
        let ingredientKeys = (1...20).map { FullMealModel.CodingKeys(rawValue: "strIngredient\($0)") }
        strIngredients = ingredientKeys.compactMap { key in
            return try? container.decode(String.self, forKey: key!)
        }

        let measureKeys = (1...20).map { FullMealModel.CodingKeys(rawValue: "strMeasure\($0)") }
        strMeasures = measureKeys.compactMap { key in
            return try? container.decode(String.self, forKey: key!)
        }

    }
}

struct MealResponse: Decodable {
    var meals: [FullMealModel]
    
    enum CodingKeys: String, CodingKey {
      case meals = "meals"
    }
}

class FullMealViewModel: Identifiable, ObservableObject {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strTags: String
    let strYoutube: String
    let strIngredients: [String]
    let strMeasures: [String]
    let strSource: String
    
    init(meal: FullMealModel) {
        self.idMeal = meal.idMeal
        self.strMealThumb = meal.strMealThumb
        self.strMeal = meal.strMeal
        self.strCategory = meal.strCategory
        self.strArea = meal.strArea
        self.strInstructions = meal.strInstructions
        self.strTags = meal.strTags ?? ""
        self.strYoutube = meal.strYoutube ?? ""
        self.strIngredients = meal.strIngredients
        self.strMeasures = meal.strMeasures
        self.strSource = meal.strSource ?? ""
    }
}
