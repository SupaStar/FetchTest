//
//  FetchIndexUITests
//  FetchTestUITests
//
//  Created by Obed Martinez on 11/08/23
//



import XCTest

final class FetchIndexUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    override func tearDownWithError() throws {
        app.terminate() // Cerrar la app al final de cada test
    }
    
    func testNavigationToDetail() throws {
        app.launch()
        let mealName = "Apam balik"
        XCTAssertTrue(app.navigationBars["Meals List"].waitForExistence(timeout: 10))
        let cellWithMealName = app.staticTexts[mealName]
        XCTAssertTrue(cellWithMealName.waitForExistence(timeout: 10))
        cellWithMealName.tap()
        XCTAssertTrue(app.staticTexts[mealName].exists)
    }
    
    func testScroll() throws {
        app.launch()
        XCTAssertTrue(app.navigationBars["Meals List"].waitForExistence(timeout: 10))
        let scrollView = app.scrollViews.firstMatch
        for _ in 1...5 { // Realiza 5 swipes hacia arriba
            scrollView.swipeUp()
        }
    }

    func testScrollDown() throws {
        app.launch()
        XCTAssertTrue(app.navigationBars["Meals List"].waitForExistence(timeout: 10))
        let scrollView = app.scrollViews.firstMatch
        for _ in 1...5 { // Realiza 5 swipes hacia arriba
            scrollView.swipeUp()
        }
        sleep(2)
        for _ in 1...2 { // Realiza 5 swipes hacia abajo
            scrollView.swipeDown()
        }
    }
}

extension XCUIElementQuery {
    var lastMatch: XCUIElement {
        return element(boundBy: count - 1)
    }
}
