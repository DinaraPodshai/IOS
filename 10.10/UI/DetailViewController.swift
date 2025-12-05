import UIKit
import Kingfisher

final class DetailViewController: UIViewController {

    private let hero: Superhero

    private let heroImage = UIImageView()
    private let nameLabel = UILabel()
    private let realNameLabel = UILabel()
    private let descLabel = UILabel()

    init(hero: Superhero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
        fillData()
    }

    private func setupUI() {
        heroImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        realNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false

        descLabel.numberOfLines = 0

        view.addSubview(heroImage)
        view.addSubview(nameLabel)
        view.addSubview(realNameLabel)
        view.addSubview(descLabel)

        NSLayoutConstraint.activate([
            heroImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heroImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heroImage.widthAnchor.constraint(equalToConstant: 180),
            heroImage.heightAnchor.constraint(equalToConstant: 180),

            nameLabel.topAnchor.constraint(equalTo: heroImage.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            realNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            realNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descLabel.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: 20),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    private func fillData() {
        nameLabel.text = hero.name
        realNameLabel.text = hero.realName
        descLabel.text = hero.description

        if let url = URL(string: hero.imageUrl) {
            heroImage.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
        }
    }
}
