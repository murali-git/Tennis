enum CurrentPlayer {
    case FirstPlayer
    case SecondPlayer
}

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
        if(isPlayerScoresEqual()) {
            return firstPlayer.translateScore() + TennisConstant.All.rawValue
        }
        
        if(isBothPlayerScoreLessThanEqualToFourty()) {
            return firstPlayer.translateScore() + "-" + secondPlayer.translateScore()
        }
        
        return TennisConstant.Empty.rawValue
    }
    
    private func isPlayerScoresEqual() -> Bool {
        return firstPlayer.getScore() == secondPlayer.getScore()
    }
    
    private func isBothPlayerScoreLessThanEqualToFourty() -> Bool{
        return isPlayerScoreLessThanForty(firstPlayer) && isPlayerScoreLessThanForty(secondPlayer)
    }
    
    private func isPlayerScoreLessThanForty(_ player: Player) -> Bool{
        return player.getScore() <= 3
    }
}
