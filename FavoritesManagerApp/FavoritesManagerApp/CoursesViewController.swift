//
//  CoursesViewController.swift
//  FavoritesManagerApp
//
//  Created by Nazerke Zheken on 19.11.2025.
//

import UIKit

class CoursesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var items: [FavoriteItem] = [
        FavoriteItem(
            title: "Calculus 2",
            imageName: "calculus",
            description: "Borsikbayeva Aliya",
            review: "Best of the best, it was a very interesting course, cause I love math and Aliya alai one love 10/10"
        ),
        FavoriteItem(
            title: "Linear Algebra",
            imageName: "linear_algebra",
            description: "Bazarbayeva Larisa",
            review: "At first, it was a total mess, with schedule and teachers, but as a discipline it was interesting for me cause I am good at math, so I had 7-8 extra bonus points at the end of the semester, lower rating cause of the teachers 7.5/10"
        ),
        FavoriteItem(
            title: "Statistics",
            imageName: "statistics",
            description: "Kulpeshov Beibit",
            review: "Such an angel again, funny, kind and the best. Discipline was interesting and pricolnyi, 10/10"
        ),
        FavoriteItem(
            title: "Algorithms and Data Structures",
            imageName: "algorithms_ds",
            description: "Ergaliev Askar and Maksutkyzy",
            review: "Well, I like solving contests, but labs were a little bit too much, so at some point I stopped trying solving them, and exams were a little too much, but algorithms and data structures itself is interesting and cool 8/10"
        ),
        FavoriteItem(
            title: "Object-Oriented Programming",
            imageName: "oop",
            description: "Shamoi Pakizar",
            review: "She is so cool and kind, and a pro. With her teaching, discipline was easy and interesting, and the final project... it was pure torture, but okkaaaay. 9.5/10"
        ),
        FavoriteItem(
            title: "Computer Architecture",
            imageName: "computer_architecture",
            description: "Yoldash Suhrab",
            review: "He is an angel, best of the best. Discipline is not hard and not interesting for me, but that's like the must-have knowledge, so okay. 9.5/10"
        ),
        FavoriteItem(
            title: "Web Development",
            imageName: "web_development",
            description: "Kuralbayev Aibek and Izbassar Assylzhan",
            review: "It waaaas good, well basics of web development, learnt a lot. But can't say that I loved it. 8/10"
        ),
        FavoriteItem(
            title: "Applied Cryptography",
            imageName: "applied_cryptography",
            description: "Begimbayeva Enlik",
            review: "Well, I wanted to try myself in security field, but I kinda hated this discipline, it was almost about nothing I gueessss. 7/10"
        ),
        FavoriteItem(
            title: "Computer Networks",
            imageName: "computer_networks",
            description: "Zhaxalykov Temirlan and Begenov Mels",
            review: "Well this discipline was really hard, but I made it in top-3, so I'm not complaining. Though teachers and discipline did play on my nerves. 8/10"
        ),
        FavoriteItem(
            title: "iOS Development",
            imageName: "ios",
            description: "Myrzakanurov Arman",
            review: "I am still trying to figure out the field in which I want to start/continue my career path. So I chose this discipline. Lectures are interesting and not hard to understand, and I think I am gaining some good knowledge and I feel like this might be the path that I want to choose cause I feel comfortable practicing with it. Prepod is cool and genuine, best of the best. 10/10"
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

extension CoursesViewController: UITableViewDataSource, UITableViewDelegate {
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

