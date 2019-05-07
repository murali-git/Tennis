class TennisGamePresenter {
    private let firstPlayer: Player
    private let secondPlayer: Player
    private let unowned tennisGameView:
    
    init(_ firstPlayer: Player,_ secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func scoresPoint(_ currentPlayer: CurrentPlayer) {
        switch currentPlayer {
        case .FirstPlayer:
            firstPlayer.updateScore()
        case .SecondPlayer:
            secondPlayer.updateScore()
        }
    }
    
    func getPlayersScore() -> String {
        if isWinner() {
            return highestScorePlayerName() + " " + TennisStatus.Won.rawValue
        }
        
        if isAdvantage() {
            return TennisStatus.Advantage.rawValue + " " + highestScorePlayerName()
        }
        
        if isDeuce() {
            return TennisStatus.Deuce.rawValue
        }
        
        if isPlayersScoresEqual() {
            return firstPlayer.translateScore() + " " + TennisStatus.All.rawValue
        }

        return firstPlayer.translateScore() + " - " + secondPlayer.translateScore()
    }
    
    // MARK: Tennis Game scenarios
    private func isWinner() -> Bool {
        return isAnyPlayerScoreGreaterThanFourty() && isPointDifferenceMoreThanOne()
    }
    
    private func isAdvantage() -> Bool {
        return isBothPlayerScoreGreaterThanOrEqualToFourty() && isPointDifferenceIsEqualToOne()
    }
    
    private func isDeuce() -> Bool{
        return isPlayersScoresEqual() && isBothPlayerScoreGreaterThanOrEqualToFourty()
    }
    
    private func isPlayersScoresEqual() -> Bool {
        return firstPlayer.currentScore() == secondPlayer.currentScore()
    }

    // MARK: Helper Methods for tennis score scenarios
    private func isPointDifferenceMoreThanOne() -> Bool {
        return abs(firstPlayer.currentScore() - secondPlayer.currentScore()) > 1
    }
    
    private func isPointDifferenceIsEqualToOne() -> Bool {
        return abs(firstPlayer.currentScore() - secondPlayer.currentScore()) == 1
    }
    
    private func highestScorePlayerName() -> String {
        if hasFirstPlayerGotHighestScore() {
            return firstPlayer.name()
        }
        
        return secondPlayer.name()
    }
    
    private func hasFirstPlayerGotHighestScore() -> Bool {
        return firstPlayer.currentScore() > secondPlayer.currentScore()
    }
    
    private func isBothPlayerScoreGreaterThanOrEqualToFourty() -> Bool{
        return firstPlayer.isPlayerScoreGreaterThanOrEqualToForty() && secondPlayer.isPlayerScoreGreaterThanOrEqualToForty()
    }
    
    private func isAnyPlayerScoreGreaterThanFourty() -> Bool {
        return firstPlayer.isPlayerScoreGreaterThanForty() || secondPlayer.isPlayerScoreGreaterThanForty()
    }
}
