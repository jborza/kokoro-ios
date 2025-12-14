import Foundation
import Combine

@MainActor
class KokoroTTSViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var isProcessing = false
    @Published var isPlaying = false
    @Published var status: String?
    
    private let ttsService = TTSService()
    
    init() {
        status = "Ready"
    }
    
    func synthesize() async {
        isProcessing = true
        status = "Generating audio..."
        
        do {
            try await ttsService.synthesizeAndPlay(text: inputText)
            isPlaying = true
            status = "Playing audio..."
            
            // Simulate playback completion
            try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds placeholder
            isPlaying = false
            status = "Complete"
        } catch {
            status = "Error: \(error.localizedDescription)"
        }
        
        isProcessing = false
    }
    
    func stop() {
        ttsService.stop()
        isPlaying = false
        status = "Stopped"
    }
}
