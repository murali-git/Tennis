import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {
    
    func test_ShouldThrowException_WhenPlayerNameIsGivenEmpty() {
        XCTAssertThrowsError(try Player.init("")) { error in
            XCTAssertEqual(error as? TennisError, TennisError.PlayerNameCannotBeEmpty)
        }
    }
    
    func test_ShouldReturnLoveScore_WhenPlayerIsInitializedWithDefaultValues() {
        let firstPlayer = try! Player.init("FirstPlayer")
        
        XCTAssertEqual(Points.Love, firstPlayer.getScore())
    }
    
    func test_ShouldReturnFifteenScore_WhenPlayerScoreIsUpdated() {
        let firstPlayer = try! Player.init("FirstPlayer")
        
        firstPlayer.addScore()
        
        XCTAssertEqual(Points.Fifteen, firstPlayer.getScore())
    }
}
