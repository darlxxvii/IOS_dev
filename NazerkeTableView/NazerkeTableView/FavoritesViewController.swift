import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sections = [
        "Favorite Movies",
        "Favorite Music",
        "Favorite Books",
        "Favorite University Courses",
    ]
    
    let items: [[FavoriteItem]] = [
        [ //movies
         FavoriteItem(title: "Frozen", subtitle: "Chris Buck, Jennifer Lee", review: "My favorite film as a child, used to rewatch it again and again. I'm in love with Elsa's character and with plot", imageName: "frozen"),
         FavoriteItem(title: "The Maze Runner", subtitle: "Wes Ball", review: "Very interesting plot, strong acting, and so many cool characters like Newt and Minho. Actors did a great job!", imageName: "maze_runner"),
         FavoriteItem(title: "Game of Thrones", subtitle: "David Benioff, D.B. Weiss", review: "Complex characters, INTRICATE PLOT(i enoyed trying to figure out everything). However, the final season ... I think my fav character is Daenerys Stormborn. Planning on reading books, cause it is even more detailed and intricate.", imageName: "got"),
         FavoriteItem(title: "House of the Dragon", subtitle: "Ryan J. Condal, George R.R. Martin", review: "I liked House of the Dragon even more that GOT. Because, there is more dragon scenes and so much more drama around my favorite house(Targarien)", imageName: "hotd"),
         FavoriteItem(title: "Attack on Titan", subtitle: "Hajime Isayama", review: "Genius plot, absolutely a MASTERPIECE. Love everything about AOT, the characters, the soundtrack, excellent twists! My poor Eren", imageName: "aot")
        ],
        [ //songs
            FavoriteItem(title: "Chicago", subtitle: "Michael Jackson", review: "Pure pop perfection.", imageName: "chicago"),
             FavoriteItem(title: "Swimming Pools", subtitle: "Kendrick Lamar", review: "Just vibes", imageName: "pools"),
             FavoriteItem(title: "Attention", subtitle: "Charlie Puth", review: "Beautiful vocals", imageName: "attention"),
             FavoriteItem(title: "Ma Meilleure Ennemie", subtitle: "Stromae, Pomme", review: "From Arcane, dreamy and aesthetic.", imageName: "ma"),
             FavoriteItem(title: "Almaty tuni", subtitle: "Kairat Nurtas", review: "A vibe from start to finish.", imageName: "almaty")
        ],
        [ //books
            FavoriteItem(title: "Think and Grow Rich", subtitle: "Napoleon Hill", review: "I liked it, many helpul advices, not only about money, but about mind and thinking", imageName: "rich"),
            FavoriteItem(title: "Jane Eyre", subtitle: "Charlotte Brontë", review: "Very touching story about life of Jane, in the end you may cry", imageName: "jane"),
            FavoriteItem(title: "Rich Dad and Poor Dad", subtitle: "Robert Kiyosaki", review: "Really helpful book with many advices and can change your perception and the way you think.", imageName: "poor"),
            FavoriteItem(title: "The Green Mile", subtitle: "Stephen King", review: "One more touching book about big and kind guy. Easy and interesting to read", imageName: "green"),
            FavoriteItem(title: "The A.B.C. Murders", subtitle: "Agatha Christie", review: "Perfect detective storytelling. To be honest, I kinda guessed the killer, motives were clear", imageName: "abc")
        ],
        [  // University Courses
            FavoriteItem(title: "iOS Development", subtitle: "Arman Myrzakanurov", review: "Lessons are interesting and teacher is kind and cool. Building apps is very interesting if you let your imagination be free.", imageName: "ios"),
            FavoriteItem(title: "Linear Algebra", subtitle: "Complexity & logic", review: "It boosted my mathematical thinking and problem-solving skills.", imageName: "linear"),
            FavoriteItem(title: "Intro to Machine Learning", subtitle: "Olivier Jaylet", review: "I only registered for this course, but I am sure that I will like it, heard Olivier is cool.", imageName: "intro"),
            FavoriteItem(title: "Calculus", subtitle: "Borsikbayeva Aliya", review: "I like math, so this discipline was easy for me and very interesting, Borsikbayeva is the best!", imageName: "calc"),
            FavoriteItem(title: "Statistics", subtitle: "Kupleshov Beibit", review: "Beibit agai is very kind and funny, course was interesting and easy.", imageName: "statistics")
        ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 130
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 //items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteCell
        let item = items[indexPath.section][indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

