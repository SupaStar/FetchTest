//
//  Const
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import Foundation
import SwiftUI

//API
let baseURL = "https://themealdb.com/api/json/v1/1/"

// UI/UX
let feedback = UIImpactFeedbackGenerator(style: .medium)


// LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
var gridMealLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// FUNCS
func buildURL() -> URL? {
    let components = URLComponents(string: baseURL)
    return components?.url
}

//DATA
func sampleMealSimple() -> SimpleMealViewModel {
    let sampleMeal = SimpleMealModel(idMeal: "123", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", strMeal: "Sample Meal")
    return SimpleMealViewModel(meal: sampleMeal)
}

let json = """
{
    "idMeal": "123",
    "strMeal": "Sample Meal",
    "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
    "strCategory": "Category",
    "strArea": "Area",
    "strInstructions": "Instructions",
    "strDrinkAlternate": null,
    "strTags": null,
    "strYoutube": null,
    "strSource": "Source",
    "strImageSource": null,
    "strCreativeCommonsConfirmed": null,
    "dateModified": null,
    "strIngredient1": "Ingredient 1",
    "strIngredient2": "Ingredient 2",
    "strMeasure1": "Measure 1",
    "strMeasure2": "Measure 2"
}
"""
func sampleFull() -> FullMealViewModel? {
    let jsonData = json.data(using: .utf8)!
    do {
        let decoder = JSONDecoder()
        let fullMealModel = try decoder.decode(FullMealModel.self, from: jsonData)
        let fullMeal: FullMealViewModel = FullMealViewModel(meal: fullMealModel)
        return fullMeal
    } catch {
        print("Error decoding JSON: \(error)")
    }
    return nil
}
