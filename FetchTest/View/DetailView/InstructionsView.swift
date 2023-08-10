//
//  InstructionsView
//  FetchTest
//
//  Created by Obed Martinez on 10/08/23
//



import SwiftUI

struct InstructionsView: View {
    // MARK: PROPERTIES
    let meal: FullMealViewModel?
    // MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Text(meal?.strInstructions ?? "dasdasdasadsdasdasdsaasdasdadadsadasdasdasdasdasdas")
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(meal: nil)
    }
}
