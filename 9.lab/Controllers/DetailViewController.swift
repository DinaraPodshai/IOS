import UIKit

final class DetailViewController: UIViewController {
    // UI
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let heroImageView = UIImageView()
    private let nameLabel = UILabel()
    private let fullNameLabel = UILabel()
    private let publisherLabel = UILabel()
    private let alignmentLabel = UILabel()
    private let statsStack = UIStackView()
    private let intelligenceLabel = UILabel()
    private let strengthLabel = UILabel()
    private let speedLabel = UILabel()
    private let durabilityLabel = UILabel()
    private let powerLabel = UILabel()
    private let combatLabel = UILabel()
    private let appearanceLabel = UILabel()
    private let workLabel = UILabel()
    private let connectionsLabel = UILabel()

    // Data
    private var heroes: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupNavigation()
        fetchHeroes()
    }

    private func setupNavigation() {
        title = "Superhero"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Randomize", style: .done, target: self, action: #selector(randomizeTapped))
    }

    private func setupViews() {
        // scrollView
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // contentView inside scrollView
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        // stackView
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])

        // image
        heroImageView.contentMode = .scaleAspectFit
        heroImageView.layer.cornerRadius = 12
        heroImageView.clipsToBounds = true
        heroImageView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        stackView.addArrangedSubview(heroImageView)

        // labels config
        [nameLabel, fullNameLabel, publisherLabel, alignmentLabel].forEach {
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 16)
            stackView.addArrangedSubview($0)
        }
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)

        // stats
        statsStack.axis = .vertical
        statsStack.spacing = 6
        statsStack.alignment = .leading
        [intelligenceLabel, strengthLabel, speedLabel, durabilityLabel, powerLabel, combatLabel].forEach {
            $0.numberOfLines = 1
            $0.font = UIFont.systemFont(ofSize: 15)
            statsStack.addArrangedSubview($0)
        }
        stackView.addArrangedSubview(statsStack)

        // other labels
        [appearanceLabel, workLabel, connectionsLabel].forEach {
            $0.numberOfLines = 0
            $0.font = UIFont.systemFont(ofSize: 15)
            stackView.addArrangedSubview($0)
        }
    }

    private func fetchHeroes() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = view.center
        spinner.startAnimating()
        view.addSubview(spinner)

        NetworkManager.shared.fetchAllHeroes { [weak self] result in
            DispatchQueue.main.async {
                spinner.removeFromSuperview()
            }
            switch result {
            case .success(let heroes):
                self?.heroes = heroes
                DispatchQueue.main.async { self?.showRandomHero(animated: false) }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showError(error)
                }
            }
        }
    }

    @objc private func randomizeTapped() {
        showRandomHero(animated: true)
    }

    private func showRandomHero(animated: Bool) {
        guard !heroes.isEmpty else { return }
        let hero = heroes.randomElement()!
        updateUI(with: hero, animated: animated)
    }

    private func updateUI(with hero: Superhero, animated: Bool) {
        let apply = {
            self.nameLabel.text = hero.name
            self.fullNameLabel.text = "Full name: \(hero.biography?.fullName ?? "—")"
            self.publisherLabel.text = "Publisher: \(hero.biography?.publisher ?? "—")"
            self.alignmentLabel.text = "Alignment: \(hero.biography?.alignment ?? "—")"
            self.intelligenceLabel.text = "Intelligence: \(hero.powerstats?.intelligence.map(String.init) ?? "—")"
            self.strengthLabel.text = "Strength: \(hero.powerstats?.strength.map(String.init) ?? "—")"
            self.speedLabel.text = "Speed: \(hero.powerstats?.speed.map(String.init) ?? "—")"
            self.durabilityLabel.text = "Durability: \(hero.powerstats?.durability.map(String.init) ?? "—")"
            self.powerLabel.text = "Power: \(hero.powerstats?.power.map(String.init) ?? "—")"
            self.combatLabel.text = "Combat: \(hero.powerstats?.combat.map(String.init) ?? "—")"
            self.appearanceLabel.text = "Appearance: \(hero.appearance?.gender ?? "—"), \(hero.appearance?.race ?? "—"), height: \(hero.appearance?.height?.first ?? "—"), weight: \(hero.appearance?.weight?.first ?? "—")"
            self.workLabel.text = "Work: \(hero.work?.occupation ?? "—") — base: \(hero.work?.base ?? "—")"
            self.connectionsLabel.text = "Connections: \(hero.connections?.groupAffiliation ?? "—") ; \(hero.connections?.relatives ?? "—")"
            self.heroImageView.image = UIImage(named: "placeholder")
        }

        if animated {
            UIView.transition(with: contentView, duration: 0.35, options: .transitionCrossDissolve, animations: apply, completion: nil)
        } else {
            apply()
        }

        // load image
        let url = hero.images?.lg ?? hero.images?.md ?? hero.images?.sm
        NetworkManager.shared.loadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            if let image = image {
                if animated {
                    UIView.transition(with: self.heroImageView, duration: 0.4, options: .transitionCrossDissolve, animations: {
                        self.heroImageView.image = image
                    }, completion: nil)
                } else {
                    self.heroImageView.image = image
                }
            } else {
                self.heroImageView.image = UIImage(named: "placeholder")
            }
        }
    }

    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: { _ in self.fetchHeroes() }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }
}
