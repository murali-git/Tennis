import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    private var tennisGame: TennisGamePresenter!
    
    override func setUp() {
        tennisGame = buildTennisGame()
    }
    
    func test_ShouldReturnLoveAll_WhenTennisGameIsStarted() {

        XCTAssertEqual(TestScores.LoveAll.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenLove_WhenFirstPlayerTakesThePoint() {
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual(TestScores.FifteenLove.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFifteenThirty_WhenSecondPlayerScoresTwoPoint() {
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        self.winConsequtivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FifteenThirty.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnFourtyThirty_WhenFirstPlayerScoresThreePoints() {
        self.winConsequtivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FourtyThirty.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanOrEqualToFourty() {
        self.winConsequtivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.Deuce.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerOne_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsequtivePointsForPlayerOne(4, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FirstPlayerAdvantage.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnAdvantageForPlayerTwo_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(6, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerAdvantage.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldReturnPlayerHasWon_WhenPlayerScoresMoreThanFourtyAndDifferenceIsMoreThanOne() {
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(7, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerWon.rawValue,tennisGame.getPlayersScore())
    }
    
    func test_ShouldNotIncreaseTheScore_WhenOneOfThePlayerHasWonTheMatch() {
        self.winConsequtivePointsForPlayerOne(5, tennisGame: tennisGame)
        self.winConsequtivePointsForPlayerTwo(7, tennisGame: tennisGame)
        let _ = tennisGame.getPlayersScore()
        self.winConsequtivePointsForPlayerOne(4, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerWon.rawValue,tennisGame.getPlayersScore())
    }
    
    private func buildTennisGame() -> TennisGamePresenter {
        let firstPlayer = buildPlayer("FirstPlayer")
        let secondPlayer = buildPlayer("SecondPlayer")

        return TennisGamePresenter.init(firstPlayer, secondPlayer)
    }
    
    private func buildPlayer(_ playerName: String) -> Player {
        return try! Player.init(playerName)
    }
    
    private func winConsequtivePointsForPlayerOne(_ numberOfTimes: Int, tennisGame: TennisGamePresenter) {
        for _ in 1 ... numberOfTimes {
            tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        }
    }
    
    private func winConsequtivePointsForPlayerTwo(_ numberOfTimes: Int, tennisGame: TennisGamePresenter) {
        for _ in 1 ... numberOfTimes {
            tennisGame.scoresPoint(CurrentPlayer.SecondPlayer)
        }
    }

}

fileprivate enum TestScores: String {
    case LoveAll = "Love All"
    case FifteenLove = "Fifteen - Love"
    case FifteenThirty = "Fifteen - Thirty"
    case FourtyThirty = "Fourty - Thirty"
    case Deuce = "Deuce"
    case FirstPlayerAdvantage = "Advantage FirstPlayer"
    case SecondPlayerAdvantage = "Advantage SecondPlayer"
    case SecondPlayerWon = "SecondPlayer Won"
}
