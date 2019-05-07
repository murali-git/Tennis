import XCTest

class TennisUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        XCUIApplication().launch()
        app = XCUIApplication()
    }

    func test_ShouldReturnFifteenAll_WhenPlayersScoreOnePointEach() {
        app.buttons["player1Scores"].tap()
        app.buttons["player2Scores"].tap()
        
        let score = app.staticTexts["Fifteen All"]
        XCTAssertTrue(score.exists)
    }
    
    func test_ShouldReturnDefaultPoints_WhenResetIsTapped() {
        app.buttons["reset"].tap()
        
        let score = app.staticTexts["Points"]
        XCTAssertTrue(score.exists)
    }
}
