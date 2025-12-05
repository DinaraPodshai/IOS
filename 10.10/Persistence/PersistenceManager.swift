import Foundation

final class PersistenceManager {

    private let key = "favorite_heroes"

    static let shared = PersistenceManager()

    func save(_ heroes: [Superhero]) {
        let encoded = try? JSONEncoder().encode(heroes)
        UserDefaults.standard.set(encoded, forKey: key)
    }

    func load() -> [Superhero] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let decoded = try? JSONDecoder().decode([Superhero].self, from: data)
        else { return [] }

        return decoded
    }
}

