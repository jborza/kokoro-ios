import Foundation
import AVFoundation

class AudioService {
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            Logger.info("Audio session configured")
        } catch {
            Logger.error("Failed to configure audio session: \(error)")
        }
    }
    
    func play(audioData: Data) async throws {
        do {
            audioPlayer = try AVAudioPlayer(data: audioData, fileTypeHint: AVFileType.wav.rawValue)
            audioPlayer?.play()
            Logger.info("Audio playback started")
            
            // Wait for playback to complete
            while audioPlayer?.isPlaying == true {
                try await Task.sleep(nanoseconds: 100_000_000) // 0.1 second
            }
            Logger.info("Audio playback completed")
        } catch {
            Logger.error("Audio playback failed: \(error)")
            throw TTSError.audioPlaybackFailed(error.localizedDescription)
        }
    }
    
    func stop() {
        audioPlayer?.stop()
        Logger.info("Audio playback stopped")
    }
    
    var isPlaying: Bool {
        return audioPlayer?.isPlaying ?? false
    }
}
