class TennisGame {
    private let firstPlayer: Player
    private let secondPlayer: Player
    
    init(_ firstPlayer: Player,_ secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
    func getPlayersScore() -> String {
        if(firstPlayer.getScore() == secondPlayer.getScore()) {
            return firstPlayer.getScore() + TennisConstant.All.rawValue
        }
        
        return TennisConstant.Empty.rawValue
    }
}
