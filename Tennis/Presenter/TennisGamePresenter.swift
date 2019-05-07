class TennisGamePresenter {
    private let firstPlayer: Player
    private let secondPlayer: Player
    private var isGameOver = false
    
    init(_ firstPlayer: Player,_ secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func scoresPoint(_ currentPlayer: CurrentPlayer) {
        if(isGameOver) {
            return
        }

        switch currentPlayer {
        case .FirstPlayer:
            firstPlayer.updateScore()
        case .SecondPlayer:
            secondPlayer.updateScore()
        }
    }
    
    func getPlayersScore() -> String {
        if isWinner() {
            isGameOver = true
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
    
    // MARK: Helper Methods
    private func isWinner() -> Bool {
        return (firstPlayer.isPlayerScoreGreaterThanForty() || secondPlayer.isPlayerScoreGreaterThanForty()) && (pointDifferenceBetweenPlayers() > 1)
    }
    
    private func isAdvantage() -> Bool {
        return isBothPlayerScoreGreaterThanOrEqualToFourty() && (pointDifferenceBetweenPlayers() == 1)
    }
    
    private func isDeuce() -> Bool{
        return isPlayersScoresEqual() && isBothPlayerScoreGreaterThanOrEqualToFourty()
    }
    
    private func isPlayersScoresEqual() -> Bool {
        return firstPlayer.currentScore() == secondPlayer.currentScore()
    }
    
    private func pointDifferenceBetweenPlayers() -> Int {
        return abs(firstPlayer.currentScore() - secondPlayer.currentScore())
    }
    
    private func highestScorePlayerName() -> String {
        if firstPlayer.currentScore() > secondPlayer.currentScore() {
            return firstPlayer.name()
        }
        
        return secondPlayer.name()
    }
    
    private func isBothPlayerScoreGreaterThanOrEqualToFourty() -> Bool{
        return firstPlayer.isPlayerScoreGreaterThanOrEqualToForty() && secondPlayer.isPlayerScoreGreaterThanOrEqualToForty()
    }
}
