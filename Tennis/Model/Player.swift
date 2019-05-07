class Player {
    private let playerName: String
    private var score: Int = 0
    
    init(_ name: String) throws {
        guard name.count > 0 else {
            throw TennisError.PlayerNameCannotBeEmpty
        }
        playerName = name
    }
    
    func updateScore() {
        score += 1
    }
    
    func getScore() -> Int {
        return score
    }
    
    func name() -> String {
        return playerName
    }
    
    func translateScore() -> String {
        switch score {
        case 0:
            return Points.Love.rawValue
        case 1:
            return Points.Fifteen.rawValue
        case 2:
            return Points.Thirty.rawValue
        default:
            return Points.Fourty.rawValue
        }
    }
    
    func isPlayerScoreGreaterThanOrEqualToForty() -> Bool{
        return score >= 3
    }
    
    func isPlayerScoreGreaterThanForty() -> Bool{
        return score > 3
    }
}
