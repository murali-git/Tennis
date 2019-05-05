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
            return TennisConstant.Advantage.rawValue + " " + highestScorePlayerName()
        }
        
        if(isDeuce()) {
            return TennisConstant.Deuce.rawValue
        }
        
        if(isPlayersScoresEqual()) {
            return firstPlayer.translateScore() + " " + TennisConstant.All.rawValue
        }

        return firstPlayer.translateScore() + " - " + secondPlayer.translateScore()
    }
    
    // MARK: Tennis Game scenarios
    private func isAdvantage() -> Bool {
        return isBothPlayerScoreGreaterThanOrEqualToFourty() && isPointDifferenceIsOne()
    }
    
    private func isDeuce() -> Bool{
        return isPlayersScoresEqual() && isBothPlayerScoreGreaterThanOrEqualToFourty()
    }
    
    private func isPlayersScoresEqual() -> Bool {
        return firstPlayer.getScore() == secondPlayer.getScore()
    }

    // MARK: Helper Methods for tennis score scenarios
    private func isPointDifferenceIsOne() -> Bool {
        if hasFirstPlayerGotHighestScore() {
            return hasFirstPlayerTakenAdvantage()
        }
        
        return hasSecondPlayerTakenAdvantage()
    }
    
    private func hasFirstPlayerTakenAdvantage() -> Bool {
        return firstPlayer.getScore() - secondPlayer.getScore() == 1
    }
    
    private func hasSecondPlayerTakenAdvantage() -> Bool {
        return secondPlayer.getScore() - firstPlayer.getScore() == 1
    }

    private func hasFirstPlayerGotHighestScore() -> Bool {
        return firstPlayer.getScore() > secondPlayer.getScore()
    }
    
    private func highestScorePlayerName() -> String {
        if hasFirstPlayerGotHighestScore() {
            return firstPlayer.name()
        }
        
        return secondPlayer.name()
    }
    
    private func isBothPlayerScoreGreaterThanOrEqualToFourty() -> Bool{
        return firstPlayer.isPlayerScoreGreaterThanOrEqualToForty() && secondPlayer.isPlayerScoreGreaterThanOrEqualToForty()
    }
}
