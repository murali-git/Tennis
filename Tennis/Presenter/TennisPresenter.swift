class TennisPresenter {
    private let firstPlayer: Player
    private let secondPlayer: Player
    private let tennisView: TennisView
    
    private var isGameOver = false
    
    init(_ firstPlayer: Player,_ secondPlayer: Player,_ tennisView: TennisView) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.tennisView = tennisView
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
    
    func playersScore(){
        if isWinner() {
            isGameOver = true
            tennisView.displayScore(gameStatus:highestScorePlayerName() + " " + TennisStatus.Won.rawValue)
            return
        }
        
        if isAdvantage() {
            tennisView.displayScore(gameStatus: TennisStatus.Advantage.rawValue + " " + highestScorePlayerName())
            return
        }
        
        if isDeuce() {
            tennisView.displayScore(gameStatus: TennisStatus.Deuce.rawValue)
            return
        }
        
        tennisView.displayScore(gameStatus: firstPlayer.translateScore() + " - " + secondPlayer.translateScore())
    }
    
    // MARK: Helper Methods
    private func isWinner() -> Bool {
        return hasPlayersScoredMoreThanFourtyPoints() && pointDifferenceBetweenPlayers() > 1
    }
    
    private func isAdvantage() -> Bool {
        return hasPlayersScoredMoreThanFourtyPoints() && pointDifferenceBetweenPlayers() == 1
    }
    
    private func isDeuce() -> Bool{
        return firstPlayer.currentScore() == secondPlayer.currentScore() && hasPlayersScoredMoreThanFourtyPoints()
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
    
    private func hasPlayersScoredMoreThanFourtyPoints() -> Bool{
        return firstPlayer.hasScoredMoreThanFourtyPoints() || secondPlayer.hasScoredMoreThanFourtyPoints()
    }
}
