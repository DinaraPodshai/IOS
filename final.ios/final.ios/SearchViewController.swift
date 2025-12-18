import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isScrollEnabled = false
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SampleData.genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "GenreCell",
            for: indexPath
        ) as? GenreCell else {
            return UICollectionViewCell()
        }

        let genre = SampleData.genres[indexPath.item]
        cell.titleLabel.text = genre.title
        cell.contentView.backgroundColor = genre.color
        cell.contentView.layer.cornerRadius = 12
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedGenre = SampleData.genres[indexPath.item]
        
        let genrePlaylist = MusicItem(
            title: selectedGenre.title,
            subtitle: "Best songs in \(selectedGenre.title) genre",
            imageName: "music1",
            tracks: SampleData.playlists[0].tracks
        )
        
        let detailVC = DetailViewController(item: genrePlaylist)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 48) / 2
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
