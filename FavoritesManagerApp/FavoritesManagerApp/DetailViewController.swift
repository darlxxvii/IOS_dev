import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!

    var item: FavoriteItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let item = item else { return }
        titleLabel.text = item.title
        descriptionTextView.text = item.description
        reviewLabel.text = item.review
        imageView.image = UIImage(named: item.imageName)
        
    }
}
