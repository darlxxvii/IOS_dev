//
//  MusicViewController.swift
//  FavoritesManagerApp
//
//  Created by Nazerke Zheken on 19.11.2025.
//

import UIKit

class MusicViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var items: [FavoriteItem] = [
        FavoriteItem(
            title: "Swimming Pools",
            imageName: "swimming_pools",
            description: "A smooth hip-hop track by Kendrick Lamar.",
            review: "Just vibe"
        ),
        FavoriteItem(
            title: "End of Beginning",
            imageName: "end_of_beginning",
            description: "Energetic electronic track by Djo.",
            review: "Vibe vibe"
        ),
        FavoriteItem(
            title: "Feel Good Inc.",
            imageName: "feel_good_inc",
            description: "A funky collaboration by Gorillaz and De La Soul.",
            review: "Крутая песня"
        ),
        FavoriteItem(
            title: "Do I Wanna Know?",
            imageName: "do_i_wanna_know",
            description: "A catchy alternative rock track by Arctic Monkeys.",
            review: "Прикольная"
        ),
        FavoriteItem(
            title: "Ma meilleure Ennemie",
            imageName: "ma_meilleure_ennemie",
            description: "From the Arcane soundtrack, atmospheric and cool.",
            review: "From Arcane, so its a vibe"
        ),
        FavoriteItem(
            title: "505",
            imageName: "505",
            description: "A moody and melodic song by Arctic Monkeys.",
            review: "Cool song"
        ),
        FavoriteItem(
            title: "Sunflower",
            imageName: "sunflower",
            description: "Post Malone's hit from the Spider-Man: Into the Spider-Verse soundtrack.",
            review: "Cool song from Spider-Man movie"
        ),
        FavoriteItem(
            title: "Chest Pain",
            imageName: "chest_pain",
            description: "Malcolm Todd track with catchy vocals.",
            review: "I like the 'I looove' part, cause it reminds me of times when I played repo with friends"
        ),
        FavoriteItem(
            title: "Attention",
            imageName: "attention",
            description: "A pop song by Charlie Puth with a catchy beat.",
            review: "I like this song since I've been learning English with teacher Zhanel, vibes, vibes"
        ),
        FavoriteItem(
            title: "Lose My Mind",
            imageName: "lose_my_mind",
            description: "Don Toliver and Doja Cat track from the F1 movie playlist.",
            review: "Loved the F1 movie, and its playlist is just vibes"
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

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
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


