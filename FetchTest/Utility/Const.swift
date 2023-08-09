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

// LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
var gridMealLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}


func buildURL() -> URL? {
    let components = URLComponents(string: baseURL)
    return components?.url
}

func sampleMealSimple() -> SimpleMealViewModel {
    let sampleMeal = SimpleMealModel(idMeal: "123", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", strMeal: "Sample Meal")
    return SimpleMealViewModel(meal: sampleMeal)
}

