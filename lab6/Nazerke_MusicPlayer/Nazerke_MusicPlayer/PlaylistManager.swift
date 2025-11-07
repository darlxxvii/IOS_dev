import Foundation

final class PlaylistManager {
    private(set) var tracks: [Track]
    private(set) var currentIndex: Int = 0
    
    var currentTrack: Track? {
        guard !tracks.isEmpty else { return nil }
        return tracks[currentIndex]
    }
    
    init(tracks: [Track]) {
        self.tracks = tracks
    }
     
    func next(wrap: Bool = true) {
        guard !tracks.isEmpty else { return }
        if currentIndex < tracks.count - 1 {
            currentIndex += 1
        } else if wrap {
            currentIndex = 0
        }
    }
    
    func previous(wrap: Bool = true) {
        guard !tracks.isEmpty else { return }
        if currentIndex > 0 {
            currentIndex -= 1
        } else if wrap{
            currentIndex = tracks.count - 1
        }
    }
    
    func jump(to index: Int) {
        guard tracks.indices.contains(index) else { return }
        currentIndex = index
    }
}
