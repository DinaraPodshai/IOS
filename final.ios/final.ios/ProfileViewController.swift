import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // Числа статистики (если захотите их менять из кода)
    @IBOutlet weak var playlistsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        // Делаем аватар круглым
        // При размере 100x100, cornerRadius должен быть 50
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        
        // Установим фото (если оно есть в Assets)
        avatarImageView.image = UIImage(named: "admin")
    }

    @IBAction func logOutTapped(_ sender: UIButton) {
        // Логика при нажатии на выход
        let alert = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { _ in
            print("Пользователь вышел")
        }))
        present(alert, animated: true)
    }
}
