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
            ContentView(viewModel: IndexViewModel())
                .preferredColorScheme(.light)
        }
    }
}
