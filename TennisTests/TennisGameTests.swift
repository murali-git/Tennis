import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    
    func test_ShouldReturnLoveAll_WhenTennisGameIsInitialized() {
        let tennisGame = buildTennisGame()
        
        XCTAssertEqual("LoveAll",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenLove_WhenFirstPlayerTakesThePoint() {
        let tennisGame = buildTennisGame()
        
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual("Fifteen-Love",tennisGame.getPlayersScore())
    }
    
    private func buildTennisGame() -> TennisGame {
        let firstPlayer = buildPlayer("FirstPlayer")
        let secondPlayer = buildPlayer("SecondPlayer")

        return TennisGame.init(firstPlayer, secondPlayer)
    }
    
    private func buildPlayer(_ playerName: String) -> Player {
        return try! Player.init(playerName)
    }
}
