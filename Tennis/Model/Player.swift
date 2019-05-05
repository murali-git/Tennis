class Player {
    private var playerName: String! // Var and ! is used to check exception and then initialize
    
    init(_ name: String) throws {
        try throwErrorWhenPlayerNameIsInitializedWithEmpty(name)
        playerName = name
    }
    
    private func throwErrorWhenPlayerNameIsInitializedWithEmpty(_ name: String) throws {
        guard name.count > 0 else {
            throw TennisError.PlayerNameCannotBeEmpty
        }
    }
}
