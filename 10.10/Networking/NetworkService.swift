import Alamofire
import Foundation

final class NetworkService {

    static let shared = NetworkService()

    func fetchSuperheroes(completion: @escaping ([Superhero]) -> Void) {
        let url = "https://raw.githubusercontent.com/akabab/superhero-api/0.2.0/api/all.json"

        AF.request(url).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let heroes):
                completion(heroes)
            case .failure(let error):
                print("Network error:", error)
                completion([])
            }
        }
    }
}
