import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    private let baseURL = "https://akabab.github.io/superhero-api/api"
    private let session = URLSession(configuration: .default)

    // Простой in-memory кэш для картинок
    private let imageCache = NSCache<NSString, UIImage>()

    func fetchAllHeroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/all.json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let heroes = try decoder.decode([Superhero].self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            DispatchQueue.main.async { completion(nil) }
            return
        }

        if let cached = imageCache.object(forKey: urlString as NSString) {
            DispatchQueue.main.async { completion(cached) }
            return
        }

        let task = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            self?.imageCache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async { completion(image) }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
