import UIKit

class TennisViewController: UIViewController, TennisView {
    private var tennisGamePresenter: TennisPresenter!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Tennis"
        tennisGamePresenter = buildTennisGamePresenter()
    }
    
    @IBAction func reset(_ sender: Any) {
        tennisGamePresenter = buildTennisGamePresenter()
        updateScore(TennisStatus.LoveAll.rawValue)
    }
    
    @IBAction func playerOneScores(_ sender: Any) {
        tennisGamePresenter.scoresPoint(.FirstPlayer)
        tennisGamePresenter.playersScore()
    }
    
    @IBAction func playerTwoScores(_ sender: Any) {
        tennisGamePresenter.scoresPoint(.SecondPlayer)
        tennisGamePresenter.playersScore()
    }
    
    //Mark: Helper methods
    private func buildTennisGamePresenter() -> TennisPresenter? {
        let firstPlayer = Player("FirstPlayer")
        let secondPlayer = Player("SecondPlayer")
        
        return TennisPresenter.init(firstPlayer, secondPlayer, self)
    }
    
    private func updateScore(_ score: String) {
        scoreLabel.text = score
    }
    
    //Mark: Tennis View
    func displayScore(gameStatus: String) {
        updateScore(gameStatus)
    }
}
