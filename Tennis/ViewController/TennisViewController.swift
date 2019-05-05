import UIKit

class TennisViewController: UIViewController {
    private var tennisGamePresenter: TennisGamePresenter!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Tennis"
        buildTennisGame()
    }
    
    @IBAction func playerOneWins(_ sender: Any) {
        tennisGamePresenter.playerWinsThePoint(.FirstPlayer)
        updateScore(tennisGamePresenter.getPlayersScore())
    }
    
    @IBAction func playerTwoWins(_ sender: Any) {
        tennisGamePresenter.playerWinsThePoint(.SecondPlayer)
        updateScore(tennisGamePresenter.getPlayersScore())
    }
    
    private func buildTennisGame() {
        do {
            let firstPlayer = try Player("FirstPlayer")
            let secondPlayer = try Player("SecondPlayer")
            
            self.tennisGamePresenter = TennisGamePresenter.init(firstPlayer, secondPlayer)
        }
        catch {
            updateScore("Exception in creating Tennis Presnter Class")
        }
    }
    
    private func updateScore(_ score: String) {
        scoreLabel.text = score
    }
}
