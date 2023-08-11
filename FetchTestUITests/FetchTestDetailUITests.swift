//
//  FetchTestDetailUITests
//  FetchTestUITests
//
//  Created by Obed Martinez on 11/08/23
//



import XCTest

final class FetchTestDetailUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--directToDetailView")
        app.launch()
    }

    func testShowView() throws {
        let mealName = "Apple Frangipan Tart"
        XCTAssertTrue(app.staticTexts[mealName].exists)
    }
    
    func testShowIngredients() throws {
        let mealName = "Apple Frangipan Tart"
        XCTAssertTrue(app.staticTexts[mealName].exists)
        let ingredientsUI = app.staticTexts["Ingredients:"]
        XCTAssertTrue(ingredientsUI.waitForExistence(timeout: 5))
        ingredientsUI.tap()
    }
    
    func testShowInstructions() throws {
        let mealName = "Instructions to prepare"
        XCTAssertTrue(app.staticTexts[mealName].exists)
    }
    
}
