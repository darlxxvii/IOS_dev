//
//  BooksViewController.swift
//  FavoritesManagerApp
//
//  Created by Nazerke Zheken on 19.11.2025.
//

import UIKit

class BooksViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var items: [FavoriteItem] = [
        FavoriteItem(
            title: "Crime and Punishment",
            imageName: "crime_and_punishment",
            description: "A classic Russian novel about morality, guilt, and redemption.",
            review: "My first Dostoevsky book, really enjoyed it, there's a lot to think about, overall I give 8.5/10"
        ),
        FavoriteItem(
            title: "It Ends With Us",
            imageName: "it_ends_with_us",
            description: "A contemporary romance dealing with love, trauma, and strength.",
            review: "Interesting, touching book, read in English to improve my skills, all good 8/10"
        ),
        FavoriteItem(
            title: "Murder in Alphabetical Order",
            imageName: "abc",
            description: "A mystery thriller following a unique pattern in murders.",
            review: "Actually, overall not such a complicated case, felt like you could guess who the killer was, 7.5/10"
        ),
        FavoriteItem(
            title: "The Idiot",
            imageName: "the_idiot",
            description: "A philosophical novel exploring innocence, morality, and society.",
            review: "Not as engaging as Crime and Punishment, even a bit boring 6/10"
        ),
        FavoriteItem(
            title: "Through the Eyes of the Victim",
            imageName: "through_eyes_victim",
            description: "A thriller novel told from the victim's perspective.",
            review: "Cool, wanted to read a thriller, very well described, definitely chilling 8/10"
        ),
        FavoriteItem(
            title: "Fahrenheit 451",
            imageName: "fahrenheit_451",
            description: "A dystopian novel about censorship and the power of knowledge.",
            review: "Interesting book about the value of life, books, and knowledge. Shows how grey life can be if we close ourselves from learning 9/10"
        ),
        FavoriteItem(
            title: "Atomic Habits",
            imageName: "atomic_habits",
            description: "A self-help book teaching how to build and maintain good habits.",
            review: "Great book about habits, many useful tips and practices on how habits affect life, 9.5/10"
        ),
        FavoriteItem(
            title: "The Subtle Art of Not Giving a F*ck",
            imageName: "subtle_art",
            description: "A modern self-help book about prioritizing what matters and letting go of stress.",
            review: "I read this book a long time ago, think I forgot some content, need to reread, perfect for anxious people 9.5/10"
        ),
        FavoriteItem(
            title: "The Subconscious Killer",
            imageName: "subconscious_killer",
            description: "A psychological thriller exploring the mind of a killer.",
            review: "Very cool to read from the killer's perspective, again in thriller genre, also for English practice 8.5/10"
        ),
        FavoriteItem(
            title: "Daraboz",
            imageName: "daraboz",
            description: "A historical book about the Kazakh Handygy and the life of Kabanbai Batyr.",
            review: "Interesting book about Kazakh history and Kabanbai Batyr, very detailed, feels like watching a historical series 10/10"
        )
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
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

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
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

