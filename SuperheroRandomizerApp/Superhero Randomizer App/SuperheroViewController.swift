import UIKit

class SuperheroViewController: UIViewController {
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    
    private let spinner = UIActivityIndicatorView(style: .large)
    var superheroes: [Superhero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSpinner()
        setupImageView()
        showLoadingState(true)
        
        fetchSuperheroes()
    }
    
    private func setupSpinner() {
        spinner.color = .systemBlue
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
    }

    private func setupImageView() {
        heroImageView.layer.cornerRadius = 20
        heroImageView.clipsToBounds = true
        heroImageView.backgroundColor = .systemGray5
        heroImageView.layer.shadowColor = UIColor.black.cgColor
        heroImageView.layer.shadowOpacity = 0.3
        heroImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        heroImageView.layer.shadowRadius = 10
        heroImageView.layer.masksToBounds = false
    }

    private func showLoadingState(_ loading: Bool) {
        if loading {
            nameLabel.text = "Loading..."
            fullNameLabel.text = "Loading..."
            intelligenceLabel.text = "Loading..."
            strengthLabel.text = "Loading..."
            heightLabel.text = "Loading..."
            weightLabel.text = "Loading..."
            speedLabel.text = "Loading..."
            hairColorLabel.text = "Loading..."
            powerLabel.text = "Loading..."
            eyeColorLabel.text = "Loading..."
            genderLabel.text = "Loading..."
            raceLabel.text = "Loading..."
        } else {
            spinner.stopAnimating()
        }
    }
    
    func fetchSuperheroes() {
        guard let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json") else {
            showError(message: "Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.showError(message: "Network error: \(error.localizedDescription)")
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    self.showError(message: "Invalid response from server")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showError(message: "No data received")
                }
                return
            }
            
            do {
                let decodedSuperheroes = try JSONDecoder().decode([Superhero].self, from: data)
                DispatchQueue.main.async {
                    self.superheroes = decodedSuperheroes
                    self.displayRandomSuperhero()
                }
            } catch {
                DispatchQueue.main.async {
                    self.showError(message: "JSON parsing error: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        displayRandomSuperhero()
    }
    
    func displayRandomSuperhero() {
        guard !superheroes.isEmpty else {
            showError(message: "No superheroes loaded")
            return
        }
        
        let randomHero = superheroes.randomElement()!
        
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve) {
                self.showLoadingState(true)
                self.heroImageView.image = nil
            }
        
        nameLabel.text = "Name: \(randomHero.name)"
        fullNameLabel.text = "Full Name: \(randomHero.biography.fullName)"
        intelligenceLabel.text = "Intelligence: \(randomHero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(randomHero.powerstats.strength)"
        speedLabel.text = "Speed: \(randomHero.powerstats.speed)"
        genderLabel.text = "Gender: \(randomHero.appearance.gender)"
        powerLabel.text = "Power: \(randomHero.powerstats.power)"
        hairColorLabel.text = "Hair Color: \(randomHero.appearance.hairColor)"
        eyeColorLabel.text = "Eye Color: \(randomHero.appearance.eyeColor)"
        genderLabel.text = "Gender: \(randomHero.appearance.gender)"
        raceLabel.text = "Race: \(randomHero.appearance.race ?? "Unknown")"
        heightLabel.text = "Height:\(randomHero.appearance.height[1])"
        weightLabel.text = "Weight:\(randomHero.appearance.weight[1])"
        
        // image loading asynchronously
        if let url = URL(string: randomHero.images.lg) {
                URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                    guard let self = self, let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        UIView.transition(with: self.heroImageView,
                                          duration: 0.6,
                                          options: .transitionCrossDissolve,
                                          animations: {
                            self.heroImageView.image = image
                        })
                        
                        UIView.animate(withDuration: 0.4) {
                            self.showLoadingState(false)
                        }
                    }
                }.resume()
            } else {
                spinner.stopAnimating()
            }
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
