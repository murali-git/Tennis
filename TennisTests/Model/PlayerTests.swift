import XCTest
@testable import Tennis

class PlayerTests: XCTestCase {
    
    func test_ShouldThrowException_WhenPlayerNameIsGivenEmpty() {
        XCTAssertThrowsError(try Player.init("")) { error in
            XCTAssertEqual(error as? TennisError, TennisError.PlayerNameCannotBeEmpty)
        }
    }
}
