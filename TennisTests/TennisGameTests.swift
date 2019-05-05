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
        self.winConsequtivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual("Fifteen - Thirty",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanOrEqualToFourty() {
        let tennisGame = buildTennisGame()
        
        self.winConsequtivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual("Deuce",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerOne_WhenPlayerScoresAdditionalPointAfterDeuce() {
        let tennisGame = buildTennisGame()
        
        self.winConsequtivePointsForPlayerOne(4, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual("Advantage FirstPlayer",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerTwo_WhenPlayerScoresAdditionalPointAfterDeuce() {
        let tennisGame = buildTennisGame()
        
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(6, tennisGame: tennisGame)
        
        XCTAssertEqual("Advantage SecondPlayer",tennisGame.getPlayersScore())
    }
    
    private func buildTennisGame() -> TennisGame {
        let firstPlayer = buildPlayer("FirstPlayer")
        let secondPlayer = buildPlayer("SecondPlayer")

        return TennisGame.init(firstPlayer, secondPlayer)
    }
    
    private func buildPlayer(_ playerName: String) -> Player {
        return try! Player.init(playerName)
    }
    
    private func winConsequtivePointsForPlayerOne(_ numberOfTimes: Int, tennisGame: TennisGame) {
        for _ in 1 ... numberOfTimes {
            tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        }
    }
    
    private func winConsequtivePointsForPlayerTwo(_ numberOfTimes: Int, tennisGame: TennisGame) {
        for _ in 1 ... numberOfTimes {
            tennisGame.playerWinsThePoint(CurrentPlayer.SecondPlayer)
        }
    }

}
