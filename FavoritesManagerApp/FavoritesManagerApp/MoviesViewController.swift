//
//  ViewController.swift
//  FavoritesManagerApp
//
//  Created by Nazerke Zheken on 19.11.2025.
//

import UIKit

class MoviesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var items: [FavoriteItem] = [
        FavoriteItem(
            title: "Titanic",
            imageName: "titanic",
            description: "A romantic tragedy about the ill-fated voyage of the RMS Titanic.",
            review: "Well, it is a legendary movie, I liked it and understand why it deserves Oscar 10/10"
        ),
        FavoriteItem(
            title: "Naruto",
            imageName: "naruto",
            description: "A young ninja's journey to become the strongest in his village.",
            review: "I love universe of Naruto so much, and Naruto will be forever little sweet boy for me. Legendary anime 100/10"
        ),
        FavoriteItem(
            title: "Attack on Titan",
            imageName: "attack_on_titan",
            description: "Humanity fights for survival against giant humanoid Titans.",
            review: "Great plot, everyone should watch it 100/10"
        ),
        FavoriteItem(
            title: "Jujutsu Kaisen",
            imageName: "jujutsu_kaisen",
            description: "Students battle curses in a world full of supernatural threats.",
            review: "Love all characters, great story, one love 100/10"
        ),
        FavoriteItem(
            title: "Takopi",
            imageName: "takopi",
            description: "A creepy, suspenseful story that sends chills down your spine.",
            review: "Omg this one gave me chills, it was hard to watch, and creepy, reeeeallly creepy 7/10"
        ),
        FavoriteItem(
            title: "Apothecary's Diary",
            imageName: "apothecarys_diary",
            description: "The story of an apothecary navigating mystery and intrigue.",
            review: "Very interesting, love the main character, 11/10"
        ),
        FavoriteItem(
            title: "Stranger Things",
            imageName: "stranger_things",
            description: "Kids uncover supernatural mysteries in their small town.",
            review: "Interesting, and good. 9/10"
        ),
        FavoriteItem(
            title: "Game of Thrones",
            imageName: "game_of_thrones",
            description: "Noble families battle for power in the Seven Kingdoms.",
            review: "I love the universe of this TV show, it is very interesting, though 8 seasons were long, overall super. But wasn't quite satisfied with the ending 9/10"
        ),
        FavoriteItem(
            title: "The Maze Runner",
            imageName: "maze_runner",
            description: "Teens try to escape a deadly maze full of dangerous creatures.",
            review: "In love with Minho, and loved itttt 9.5/10"
        ),
        FavoriteItem(
            title: "White Chicks",
            imageName: "white_chicks",
            description: "Comedy about two guys who magically switch bodies with girls.",
            review: "Funny to watch, perfect for relaxing and chill mood 9/10"
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue",
           let detailVC = segue.destination as? DetailViewController,
           let item = sender as? FavoriteItem {
            detailVC.item = item
        }
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        performSegue(withIdentifier: "ShowDetailSegue", sender: item)
    }
}

