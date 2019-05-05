import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    
    func test_ShouldReturnLoveAll_WhenTennisGameIsInitialized() {
        let firstPlayer = buildPlayer("FirstPlayer")
        let secondPlayer = buildPlayer("SecondPlayer")
        let tennisGame = TennisGame.init(firstPlayer, secondPlayer)
        
        XCTAssertEqual("LoveAll",tennisGame.getPlayersScore())
    }
    
    
    private func buildPlayer(_ playerName: String) -> Player {
        return try! Player.init(playerName)
    }
}
