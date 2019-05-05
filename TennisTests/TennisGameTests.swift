import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    private var tennisGame: TennisGame!
    
    override func setUp() {
        tennisGame = buildTennisGame()
    }
    
    func test_ShouldReturnLoveAll_WhenTennisGameIsInitialized() {

        XCTAssertEqual("Love All",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenLove_WhenFirstPlayerTakesThePoint() {
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual("Fifteen - Love",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenThirty_WhenSecondPlayerScoresTwoPoint() {
        tennisGame.playerWinsThePoint(CurrentPlayer.FirstPlayer)
        self.winConsequtivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual("Fifteen - Thirty",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanOrEqualToFourty() {
        self.winConsequtivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual("Deuce",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerOne_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsequtivePointsForPlayerOne(4, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual("Advantage FirstPlayer",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerTwo_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(6, tennisGame: tennisGame)
        
        XCTAssertEqual("Advantage SecondPlayer",tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnPlayerHasWon_WhenPlayerScoresMoreThanFourtyAndDifferenceIsMoreThanOne() {
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(7, tennisGame: tennisGame)
        
        XCTAssertEqual("SecondPlayer Won",tennisGame.getPlayersScore())
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
