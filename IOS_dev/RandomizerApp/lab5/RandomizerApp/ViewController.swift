import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemDescription: UILabel!

    struct Item {
        let name: String
        let imageName: String
        let description: String
    }

    let items: [Item] = [
        Item(name: "Gojo Satoru - Jujutsu Kaisen", imageName: "gojo", description: "Throughout Heaven and Earth, I alone am the honored one."),
        Item(name: "Gaara - Naruto", imageName: "gaara", description: "愛"),
        Item(name: "Ayanokoji - Classroom of The Elite", imageName: "ayanakoji", description: "In this world, winning is everything."),
        Item(name: "Nanami - Jujutsu Kaisen", imageName: "nanami", description: "I'll leave the rest to you."),
        Item(name: "Shikamaru - Naruto", imageName: "shikamaru", description: "How troublesome."),
        Item(name: "Megumi - Jujutsu Kaisen", imageName: "megumi", description: "If only more good people could receive fairness."),
        Item(name: "Neji - Naruto", imageName: "neji", description: "Fate will never smile on the fortunes of a ninja who seeks victory by falling on his own sword."),
        Item(name: "Naruto - Naruto", imageName: "naruto", description: "I won't run away, I never go back on my word!"),
        Item(name: "Levi - Attack on Titan", imageName: "levi", description: "The moment you hesitate, it's all over."),
        Item(name: "Lee - Naruto", imageName: "lee", description: "No matter how strong the opponent, I will absolutely not lose!")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func updateRandomItem() {
        guard let randomItem = items.randomElement() else { return }
        itemImageView.image = UIImage(named: randomItem.imageName)
        itemLabel.text = randomItem.name
        itemDescription.text = randomItem.description
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        updateRandomItem()
    }
}
