class Player {
    private let playerName: String
    private var score: Int = 0
    
    init(_ name: String) {
        playerName = name
    }
    
    func updateScore() {
        score += 1
    }
    
    func currentScore() -> Int {
        return score
    }
    
    func name() -> String {
        return playerName
    }
    
    func translateScore() -> String {
        switch score {
        case Score.Love:
            return Points.Love.rawValue
        case Score.Fifteen:
            return Points.Fifteen.rawValue
        case Score.Thirty:
            return Points.Thirty.rawValue
        case Score.Fourty:
            return Points.Fourty.rawValue
        default:
            return Points.Advantage.rawValue
        }
    }
    
    func hasScoredMoreThanFourtyPoints() -> Bool {
        return score > Score.Fourty
    }
}
