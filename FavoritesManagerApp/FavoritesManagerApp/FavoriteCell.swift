import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    static let identifier = "FavoriteCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with item: FavoriteItem) {
        titleLabel?.text = item.title
        
        thumbImageView?.image = UIImage(named: item.imageName)
    }
}
