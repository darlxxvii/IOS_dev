import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    let diceImages = [
        UIImage(named: "dice1"),
        UIImage(named: "dice2"),
        UIImage(named: "dice3"),
        UIImage(named: "dice4"),
        UIImage(named: "dice5"),
        UIImage(named: "dice6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollDice() // initial random dices
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        rollDice()
    }
    
    func rollDice() {
        leftDiceImageView.image = diceImages.randomElement() ?? UIImage(named: "dice1")
        rightDiceImageView.image = diceImages.randomElement() ?? UIImage(named: "dice1")
    }
    
    // bonus
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollDice()
        }
    }
}
