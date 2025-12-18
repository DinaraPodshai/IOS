import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let items = SampleData.playlists

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Your Library"
        view.backgroundColor = .systemBackground

        setupAddButton()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
    }

    private func setupAddButton() {
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonTapped)
        )
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func addButtonTapped() {
        print("Add button tapped")
    }
}

// MARK: - UITableViewDataSource
extension LibraryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "LibraryCell",
            for: indexPath
        ) as? LibraryCell else {
            return UITableViewCell()
        }

        let item = items[indexPath.row]

        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle
        cell.coverImageView.image = UIImage(named: item.imageName)
        cell.selectionStyle = .none

        return cell
    }
}

// MARK: - UITableViewDelegate
extension LibraryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let detailVC = DetailViewController(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
