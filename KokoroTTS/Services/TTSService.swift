import Foundation

class TTSService {
    private let coreMLService = CoreMLService()
    private let audioService = AudioService()
    
    init() {
        if coreMLService.isModelReady() {
            Logger.info("TTS Service initialized - model ready")
        } else {
            Logger.error("TTS Service initialized - model not ready")
        }
    }
    
    func synthesizeAndPlay(text: String) async throws {
        Logger.info("Starting TTS synthesis for: \(text)")
        
        // Step 1: Generate audio from text using Kokoro
        let audioData = try await coreMLService.generateAudio(from: text)
        
        // Step 2: Play the generated audio
        try await audioService.play(audioData: audioData)
        
        Logger.info("TTS synthesis and playback completed")
    }
    
    func stop() {
        audioService.stop()
    }
}
