import UIKit
import Alamofire
import Kingfisher

class HeroViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dynamicStackView: UIStackView!
    
    let allHeroesURL = "https://akabab.github.io/superhero-api/api/all.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // показываем последнего героя при запуске
        loadLastHero()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        fetchRandomHero()
    }
    
    func fetchRandomHero() {
        nameLabel.text = "Loading..."
        
        AF.request(allHeroesURL).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let heroes):
                let randomHero = heroes.randomElement()!
                self.display(hero: randomHero)
                self.saveLastHero(id: randomHero.id)
                
            case .failure(let error):
                self.showError("Ошибка сети: \(error.localizedDescription)")
            }
        }
    }
    
    func display(hero: Superhero) {
        nameLabel.text = hero.name
        fullNameLabel.text = hero.biography.fullName.isEmpty ? "Неизвестно" : hero.biography.fullName
        
        // очищаем старые характеристики
        dynamicStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        addLabel(text: "Intelligence: \(hero.powerstats.intelligence ?? 0)")
        addLabel(text: "Strength: \(hero.powerstats.strength ?? 0)")
        addLabel(text: "Speed: \(hero.powerstats.speed ?? 0)")
        addLabel(text: "Durability: \(hero.powerstats.durability ?? 0)")
        addLabel(text: "Power: \(hero.powerstats.power ?? 0)")
        addLabel(text: "Combat: \(hero.powerstats.combat ?? 0)")
        
        addLabel(text: "Place Of Birth: \(hero.biography.placeOfBirth)")
        addLabel(text: "Alignment: \(hero.biography.alignment)")
    
        // фото с Kingfisher
        if let url = URL(string: hero.images.lg) {
            heroImageView.kf.setImage(with: url)
        }
        
        // анимация для бонуски
        UIView.transition(with: heroImageView, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
    }
    
    func addLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.numberOfLines = 0
        dynamicStackView.addArrangedSubview(label)
    }
    
    func showError(_ message: String) {
        nameLabel.text = "Error"
        fullNameLabel.text = message
    }
    
    // сохранение последнего героя
    func saveLastHero(id: Int) {
        UserDefaults.standard.set(id, forKey: "lastHeroID")
    }
    
    // загрузка последнего героя при запуске
    func loadLastHero() {
        if let id = UserDefaults.standard.value(forKey: "lastHeroID") as? Int {
            fetchHeroByID(id: id)
        } else {
            fetchRandomHero()
        }
    }
    
    func fetchHeroByID(id: Int) {
        let url = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        AF.request(url).responseDecodable(of: Superhero.self) { response in
            switch response.result {
            case .success(let hero):
                self.display(hero: hero)
            case .failure:
                self.fetchRandomHero() // если не нашли,новый рандом
            }
        }
    }
}
