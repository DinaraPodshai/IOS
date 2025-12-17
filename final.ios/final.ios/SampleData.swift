import Foundation

// Модель данных для всего приложения

struct SampleData {
    
    // Статический массив плейлистов, доступный из любого места
    static let playlists: [MusicItem] = [
        MusicItem(title: "Chill Vibes",
                  subtitle: "Relax and unwind with smooth jazz and lo-fi.",
                  imageName: "music1"),
        
        MusicItem(title: "Workout Mix",
                  subtitle: "Get pumped up with high-energy tracks.",
                  imageName: "music2"),
        
        MusicItem(title: "Focus Flow",
                  subtitle: "Ambient sounds for deep concentration and coding.",
                  imageName: "music3"),
        
        MusicItem(title: "Pop Hits 2024",
                  subtitle: "The biggest chart-toppers of the year.",
                  imageName: "music4"),
        
        MusicItem(title: "Throwback 90's",
                  subtitle: "Relive the golden era of hip-hop and grunge.",
                  imageName: "music5"),
        
        MusicItem(title: "Midnight Drive",
                  subtitle: "Synthwave and electronic beats for late nights.",
                  imageName: "music6")
    ]
}
