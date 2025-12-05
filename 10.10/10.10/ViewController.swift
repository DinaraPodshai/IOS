import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var heroes: [Superhero] = []

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SampleCell.self, forCellReuseIdentifier: SampleCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Superheroes"

        view.backgroundColor = .systemBackground
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        loadData()
    }

    private func loadData() {
        NetworkService.shared.fetchSuperheroes { [weak self] heroes in
            DispatchQueue.main.async {
                self?.heroes = heroes
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: SampleCell.id,
            for: indexPath
        ) as! SampleCell

        cell.configure(with: heroes[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController(hero: heroes[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
