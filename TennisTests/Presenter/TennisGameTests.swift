import XCTest
@testable import Tennis

class TennisGameTests: XCTestCase {
    private var tennisGame: TennisPresenter!
    private var tennisView: SPYTennisView!
    
    override func setUp() {
        tennisView = SPYTennisView()
        tennisGame = buildTennisGame(tennisView)
    }
    
    func test_ShouldReturnFifteenLove_WhenFirstPlayerTakesThePoint() {
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual(TestScores.FifteenLove.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnFifteenThirty_WhenSecondPlayerScoresTwoPoint() {
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        self.winConsecutivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FifteenThirty.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnFourtyThirty_WhenFirstPlayerScoresThreePoints() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(2, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FourtyThirty.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnFourtyAll_WhenEachPlayersScoresThreePoints() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(3, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.FourtyAll.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnDeuce_WhenBothPlayerScoresSameScoreAndMoreThanOrEqualToFourty() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(4, tennisGame: tennisGame)
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual(TestScores.Deuce.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnAdvantageForPlayerOne_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(3, tennisGame: tennisGame)
        tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        
        XCTAssertEqual(TestScores.FirstPlayerAdvantage.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnAdvantageForPlayerTwo_WhenPlayerScoresAdditionalPointAfterDeuce() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(4, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerAdvantage.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldReturnPlayerHasWon_WhenPlayerScoresMoreThanFourtyAndDifferenceIsMoreThanOne() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(5, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerWon.rawValue,tennisView.getGameStatus())
    }
    
    func test_ShouldNotIncreaseTheScore_WhenOneOfThePlayerHasWonTheMatch() {
        self.winConsecutivePointsForPlayerOne(3, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerTwo(5, tennisGame: tennisGame)
        self.winConsecutivePointsForPlayerOne(4, tennisGame: tennisGame)
        
        XCTAssertEqual(TestScores.SecondPlayerWon.rawValue,tennisView.getGameStatus())
    }
    
    private func buildTennisGame(_ tennisView: TennisView) -> TennisPresenter {
        let firstPlayer = buildPlayer("FirstPlayer")
        let secondPlayer = buildPlayer("SecondPlayer")
        
        return TennisPresenter.init(firstPlayer, secondPlayer, tennisView)
    }
    
    private func buildPlayer(_ playerName: String) -> Player {
        return Player.init(playerName)
    }
    
    private func winConsecutivePointsForPlayerOne(_ numberOfTimes: Int, tennisGame: TennisPresenter) {
        for _ in 1 ... numberOfTimes {
            tennisGame.scoresPoint(CurrentPlayer.FirstPlayer)
        }
    }
    
    private func winConsecutivePointsForPlayerTwo(_ numberOfTimes: Int, tennisGame: TennisPresenter) {
        for _ in 1 ... numberOfTimes {
            tennisGame.scoresPoint(CurrentPlayer.SecondPlayer)
        }
    }
}

class SPYTennisView: TennisView {
    private var gameStatus = "Love All"
    
    func displayScore(gameStatus: String) {
        self.gameStatus = gameStatus
    }
    
    func getGameStatus() -> String {
        return gameStatus
    }
}

fileprivate enum TestScores: String {
    case FifteenLove = "15 - 0"
    case FifteenThirty = "15 - 30"
    case FourtyThirty = "40 - 30"
    case FourtyAll = "40 - 40"
    case Deuce = "Deuce"
    case FirstPlayerAdvantage = "Advantage FirstPlayer"
    case SecondPlayerAdvantage = "Advantage SecondPlayer"
    case SecondPlayerWon = "SecondPlayer Won"
}
