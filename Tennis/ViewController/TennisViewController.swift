import UIKit

class TennisViewController: UIViewController {
    private var tennisGamePresenter: TennisGamePresenter?
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Tennis"
        tennisGamePresenter = buildTennisGamePresenter()
    }
    
    @IBAction func reset(_ sender: Any) {
        tennisGamePresenter = buildTennisGamePresenter()
        updateScore("Points")
    }
    
    @IBAction func playerOneWins(_ sender: Any) {
        guard let tennisGame = tennisGamePresenter else {
            return
        }
        tennisGame.scoresPoint(.FirstPlayer)
        updateScore(tennisGame.getPlayersScore())
    }
    
    @IBAction func playerTwoWins(_ sender: Any) {
        guard let tennisGame = tennisGamePresenter else {
            return
        }
        tennisGame.scoresPoint(.SecondPlayer)
        updateScore(tennisGame.getPlayersScore())
    }
    
    //Mark: Helper methods
    private func buildTennisGamePresenter() -> TennisGamePresenter? {
        do {
            let firstPlayer = try Player("FirstPlayer")
            let secondPlayer = try Player("SecondPlayer")
            
            return TennisGamePresenter.init(firstPlayer, secondPlayer)
        }
        catch {
            updateScore("Exception. Please contact helpdesk")
            
            return nil
        }
    }
    
    private func updateScore(_ score: String) {
        scoreLabel.text = score
    }
}
