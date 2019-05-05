class TennisGame {
    private let firstPlayer: Player
    private let secondPlayer: Player
    
    init(_ firstPlayer: Player,_ secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func playerWinsThePoint(_ currentPlayer: CurrentPlayer) {
        switch currentPlayer {
        case .FirstPlayer:
            firstPlayer.addScore()
        case .SecondPlayer:
            secondPlayer.addScore()
        }
    }
    
    func getPlayersScore() -> String {
        if(isAdvantage()) {
            return TennisConstant.Advantage.rawValue + " " + currentPlayerName()
        }
        
        if(isDeuce()) {
            return TennisConstant.Deuce.rawValue
        }
        
        if(isPlayerScoresEqual()) {
            return firstPlayer.translateScore() + " " + TennisConstant.All.rawValue
        }

        return firstPlayer.translateScore() + " - " + secondPlayer.translateScore()
    }
    
    private func isAdvantage() -> Bool {
        return isBothPlayerScoreGreaterThanEqualToFourty() && isPointDifferenceIsOne()
    }
    
    private func isDeuce() -> Bool{
        return isPlayerScoresEqual() && isBothPlayerScoreGreaterThanEqualToFourty()
    }
    
    private func isPlayerScoresEqual() -> Bool {
        return firstPlayer.getScore() == secondPlayer.getScore()
    }

    // MARK: Helper Methods for tennis score scenarios
    private func isPointDifferenceIsOne() -> Bool {
        if isFirstPlayerHasGreaterScore() {
            return firstPlayer.getScore() - secondPlayer.getScore() == 1
        }
        else {
            return secondPlayer.getScore() - firstPlayer.getScore() == 1
        }
    }
    
    private func isFirstPlayerHasGreaterScore() -> Bool {
        return firstPlayer.getScore() > secondPlayer.getScore()
    }
    
    private func currentPlayerName() -> String {
        if isFirstPlayerHasGreaterScore() {
            return firstPlayer.name()
        }
        else {
            return secondPlayer.name()
        }
    }
    
    private func isBothPlayerScoreGreaterThanEqualToFourty() -> Bool{
        return firstPlayer.isPlayerScoreGreaterThanOrEqualToForty() && secondPlayer.isPlayerScoreGreaterThanOrEqualToForty()
    }
}
