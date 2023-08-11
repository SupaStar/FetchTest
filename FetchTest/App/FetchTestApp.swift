//
//  FetchTestApp
//  FetchTest
//
//  Created by Obed Martinez on 09/08/23
//



import SwiftUI

@main
struct FetchTestApp: App {
    var body: some Scene {
        WindowGroup {
            if CommandLine.arguments.contains("--directToDetailView") {
                DetailMealView(mealId: "52768", viewModel: DetailViewModel())
                    .preferredColorScheme(.light)
            } else {
                ContentView(viewModel: IndexViewModel())
                    .preferredColorScheme(.light)
            }
        }
    }
}
