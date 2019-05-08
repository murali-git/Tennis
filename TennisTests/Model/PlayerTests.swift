import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {
    
    func test_ShouldReturnName_WhenPlayerNameIsSet() {
        let firstPlayer = Player.init("FirstPlayer")
        
        XCTAssertEqual("FirstPlayer", firstPlayer.name())
    }
    
    func test_ShouldReturnLoveScore_WhenPlayerIsInitializedWithDefaultValues() {
        let firstPlayer = Player.init("FirstPlayer")
        
        XCTAssertEqual(Points.Love.rawValue, firstPlayer.translateScore())
    }
    
    func test_ShouldReturnFifteenScore_WhenPlayerScoreIsUpdated() {
        let firstPlayer = Player.init("FirstPlayer")
        
        firstPlayer.updateScore()
        
        XCTAssertEqual(Points.Fifteen.rawValue, firstPlayer.translateScore())
    }
}
