class Player {
    private var playerName: String! // Var and ! is used to check exception and then initialize
    private var score: Int = 0
    
    init(_ name: String) throws {
        try throwErrorWhenPlayerNameIsInitializedWithEmpty(name)
        playerName = name
    }
    
    func addScore() {
        score += 1
    }
    
    func getScore() -> String {
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
    
    private func throwErrorWhenPlayerNameIsInitializedWithEmpty(_ name: String) throws {
        guard name.count > 0 else {
            throw TennisError.PlayerNameCannotBeEmpty
        }
    }
}
