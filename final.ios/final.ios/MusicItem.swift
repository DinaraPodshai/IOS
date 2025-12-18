import UIKit

struct Track {
    let title: String
    let artist: String
    let duration: String
}

struct MusicItem {
    let title: String
    let subtitle: String
    let imageName: String
    let tracks: [Track]
}

