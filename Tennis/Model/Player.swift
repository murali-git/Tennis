class Player {
    private var playerName: String! // Var and ! is used to check exception and then initialize
    private var score: Int = 0
    
    init(_ name: String) throws {
        try throwErrorWhenPlayerNameIsInitializedWithEmpty(name)
        playerName = name
    }
    
    func getScore() -> Points {
        switch score {
        case 0:
            return Points.Love
        default:
            return Points.Fourty
        }
    }
    
    private func throwErrorWhenPlayerNameIsInitializedWithEmpty(_ name: String) throws {
        guard name.count > 0 else {
            throw TennisError.PlayerNameCannotBeEmpty
        }
    }
}
