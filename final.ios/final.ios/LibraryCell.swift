import UIKit

class LibraryCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.layer.cornerRadius = 12
        coverImageView.clipsToBounds = true
    }
}
