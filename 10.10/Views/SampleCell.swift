import UIKit
import Kingfisher

final class SampleCell: UITableViewCell {

    static let id = "SampleCell"

    private let heroImage = UIImageView()
    private let nameLabel = UILabel()
    private let realNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with hero: Superhero) {
        nameLabel.text = hero.name
        realNameLabel.text = hero.realName

        if let url = URL(string: hero.imageUrl) {
            heroImage.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
    }

    private func setupUI() {
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        realNameLabel.translatesAutoresizingMaskIntoConstraints = false

        heroImage.layer.cornerRadius = 8
        heroImage.clipsToBounds = true

        let stack = UIStackView(arrangedSubviews: [nameLabel, realNameLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(heroImage)
        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            heroImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            heroImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heroImage.widthAnchor.constraint(equalToConstant: 60),
            heroImage.heightAnchor.constraint(equalToConstant: 60),

            stack.leadingAnchor.constraint(equalTo: heroImage.trailingAnchor, constant: 12),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
