import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    
    func test_ShouldReturnLoveAll_WhenTennisGameIsInitialized() {
        let tennisGame = buildTennisGame()
        
        XCTAssertEqual("Love All",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenLove_WhenFirstPlayerTakesThePoint() {
        let tennisGame = buildTennisGame()
        
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual("Fifteen - Love",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenThirty_WhenSecondPlayerScoresTwoPoint() {
        let tennisGame = buildTennisGame()
        
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        
        XCTAssertEqual("Fifteen - Thirty",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanOrEqualToFourty() {
        let tennisGame = buildTennisGame()
        
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        
        XCTAssertEqual("Deuce",tennisGame.getPlayersScore())
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
