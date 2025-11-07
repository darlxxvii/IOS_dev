import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var audioPlayer: AVAudioPlayer?
    private var updateTimer: Timer?
    
    private func setupUI() {
        progressSlider.minimumValue = 0
        progressSlider.maximumValue = Float(audioPlayer?.duration ?? 1)
        progressSlider.value = 0
    }
    
    private lazy var playlist: PlaylistManager = {
        let tracks = [
            Track(title: "Almaty tuni", artist: "Kairat Nurtas", coverImageName: "kairat", audioFileName: "Kairat Nurtas feat. Nyusha-Алматы Түні.mp3"),
            Track(title: "Counting Stars", artist: "OneRepublic", coverImageName: "counting", audioFileName: "Counting Stars - OneRepublic.mp3"),
            Track(title: "Billie Jean", artist: "Michael Jackson", coverImageName: "michael", audioFileName: "Billie Jean - Michael Jackson.mp3"),
            Track(title: "Let it go", artist: "Elsa", coverImageName: "elsa", audioFileName: "Холодное_сердце_let_it_go_Отпусти_и_забудь.mp3"),
            Track(title: "Call out my name", artist: "The Weeknd", coverImageName: "weekend", audioFileName: "Call Out My Name - The Weeknd.mp3")
        ]
        return PlaylistManager(tracks: tracks)
    }()
    
    private var isPlaying: Bool = false {
        didSet { updatePlayPauseAppearance() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadCurrentTrack()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
        audioPlayer?.stop()
    }
    
    private func updatePlayPauseAppearance() {
        let symbolName = isPlaying ? "pause.fill" : "play.fill"
        let image = UIImage(systemName: symbolName)
        playPauseButton.setImage(image, for: .normal)
    }
    
    private func loadCurrentTrack() {
        guard let track = playlist.currentTrack else {
            titleLabel.text = "No tracks"
            artistLabel.text = nil
            coverImageView.image = nil
            return
        }
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)
        
        prepareAudioPlayer(for: track.audioFileName)
    }
    
    private func prepareAudioPlayer(for fileName: String) {
        stopTimer()
        audioPlayer?.stop()
        audioPlayer = nil
        
        let components = fileName.split(separator: ".")
        guard components.count >= 2 else {
            print("Invalid audio name")
            updateTimeLabelsForNilPlayer()
            return
        }
        let resource = components.dropLast().joined(separator: ".")
        let ext = String(components.last!)
        
        guard let url = Bundle.main.url(forResource: resource, withExtension: ext) else {
            print("Audio file not found")
            updateTimeLabelsForNilPlayer()
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            updateDurationLabels()
            progressSlider.minimumValue = 0
            progressSlider.maximumValue = Float(audioPlayer?.duration ?? 1)
            progressSlider.value = 0
        } catch {
            print("Failed to create audio player: \(error)")
            updateTimeLabelsForNilPlayer()
        }
    }
    
    private func startTimer() {
        stopTimer()
        updateTimer = Timer.scheduledTimer(timeInterval: 0.5,
                                           target: self,
                                           selector: #selector(updateProgress),
                                           userInfo: nil,
                                           repeats: true)
        RunLoop.main.add(updateTimer!, forMode: .common)
    }
    
    private func stopTimer() {
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
    @objc private func updateProgress() {
        guard let player = audioPlayer else { return }
        let current = player.currentTime
        progressSlider.value = Float(current)
        currentTimeLabel.text = formatTime(seconds: Int(current))
    }
    
    private func updateDurationLabels() {
        guard let player = audioPlayer else {
            updateTimeLabelsForNilPlayer()
            return
        }
        durationLabel.text = formatTime(seconds: Int(player.duration))
        currentTimeLabel.text = formatTime(seconds: Int(player.currentTime))
    }
    
    private func updateTimeLabelsForNilPlayer() {
        durationLabel.text = "--:--"
        currentTimeLabel.text = "0:00"
    }
    
    private func formatTime(seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%d:%02d", mins, secs)
    }
    
    @IBAction func didTapPrev(_ sender: UIButton) {
        playlist.previous(wrap: true)
        loadCurrentTrack()
        if isPlaying { audioPlayer?.play() ; startTimer() }
    }
    
    @IBAction func didTapPlayPause(_ sender: UIButton) {
        guard let player = audioPlayer else {
            
            loadCurrentTrack()
            if let player = audioPlayer {
                player.play()
                isPlaying = true
                startTimer()
            }
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
            stopTimer()
        } else {
            player.play()
            isPlaying = true
            startTimer()
        }
    }
    
    @IBAction func didTapNext(_ sender: UIButton) {
        playlist.next(wrap: true)
        loadCurrentTrack()
        if isPlaying { audioPlayer?.play() ; startTimer() }
    }
    
    @IBAction func progressSliderTouchDown(_ sender: UISlider) {
        stopTimer()
    }

    @IBAction func progressSliderChanged(_ sender: UISlider) {
        currentTimeLabel.text = formatTime(seconds: Int(sender.value))
    }

    @IBAction func progressSliderTouchUp(_ sender: UISlider) {
        guard let player = audioPlayer else { return }
        player.currentTime = TimeInterval(sender.value)
        updateProgress()
        if isPlaying { startTimer() }
    }

    
    
    
}
   extension ViewController: AVAudioPlayerDelegate {
       func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
           playlist.next(wrap: true)
           loadCurrentTrack()
           audioPlayer?.play()
           isPlaying = true
           startTimer()
       }
}

