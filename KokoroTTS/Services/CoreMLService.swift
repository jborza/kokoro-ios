import Foundation
import CoreML

class CoreMLService {
    private let kokoroModel = KokoroModel()
    
    func isModelReady() -> Bool {
        return kokoroModel.isReady()
    }
    
    func generateAudio(from text: String) async throws -> Data {
        Logger.info("Starting audio generation for text: \(text)")
        
        guard !text.isEmpty else {
            throw TTSError.invalidInput
        }
        
        do {
            let audioData = try await kokoroModel.inference(text: text)
            Logger.info("Audio generation completed")
            return audioData
        } catch {
            Logger.error("Audio generation failed: \(error)")
            throw TTSError.audioGenerationFailed(error.localizedDescription)
        }
    }
}
