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
        if(isDeuce()) {
            return TennisConstant.Deuce.rawValue
        }
        
        if(isPlayerScoresEqual()) {
            return firstPlayer.translateScore() + " " + TennisConstant.All.rawValue
        }

        return firstPlayer.translateScore() + " - " + secondPlayer.translateScore()
    }
    
    private func isPlayerScoresEqual() -> Bool {
        return firstPlayer.getScore() == secondPlayer.getScore()
    }
    
    private func isBothPlayerScoreGreaterThanEqualToFourty() -> Bool{
        return firstPlayer.isPlayerScoreGreaterThanOrEqualToForty() && secondPlayer.isPlayerScoreGreaterThanOrEqualToForty()
    }
    
    private func isDeuce() -> Bool{
        return isPlayerScoresEqual() && isBothPlayerScoreGreaterThanEqualToFourty()
    }
}
