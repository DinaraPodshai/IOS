import UIKit

struct SampleData {
    
    // Вспомогательный список из 5 песен (одинаковый для всех)
    private static let commonTracks = [
        Track(title: "LMM", artist: "Dojo Cat", duration: "4:03"),
        Track(title: "Drake", artist: "Drake", duration: "3:50"),
        Track(title: "All the star", artist: "Kendrik Lamar", duration: "3:20"),
        Track(title: "Around Me", artist: "Metro Boomn", duration: "3:23"),
        Track(title: "Goosebumps", artist: "Travis Scot", duration: "4:00")
    ]
    
    // Основной массив плейлистов
    static let playlists: [MusicItem] = [
        MusicItem(title: "Chill Vibes",
                  subtitle: "Relax and unwind with smooth jazz and lo-fi.",
                  imageName: "music1",
                  tracks: commonTracks),
        
        MusicItem(title: "Workout Mix",
                  subtitle: "Get pumped up with high-energy tracks.",
                  imageName: "music2",
                  tracks: commonTracks),
        
        MusicItem(title: "Focus Flow",
                  subtitle: "Ambient sounds for deep concentration and coding.",
                  imageName: "music3",
                  tracks: commonTracks),
        
        MusicItem(title: "Pop Hits 2024",
                  subtitle: "The biggest chart-toppers of the year.",
                  imageName: "music4",
                  tracks: commonTracks),
        
        MusicItem(title: "Throwback 90's",
                  subtitle: "Relive the golden era of hip-hop and grunge.",
                  imageName: "music5",
                  tracks: commonTracks),
        
        MusicItem(title: "Midnight Drive",
                  subtitle: "Synthwave and electronic beats for late nights.",
                  imageName: "music6",
                  tracks: commonTracks)
    ]
    
    // Массив жанров для экрана Search
    static let genres: [Genre] = [
        Genre(title: "Pop", color: .systemRed),
        Genre(title: "Rock", color: .systemBlue),
        Genre(title: "Jazz", color: .systemPurple),
        Genre(title: "Electronic", color: .systemIndigo),
        Genre(title: "Hip-Hop", color: .systemOrange),
        Genre(title: "Classical", color: .systemTeal)
    ]
}
