import Foundation

enum TTSError: LocalizedError {
    case modelNotFound
    case modelLoadingFailed(String)
    case inferenceError(String)
    case audioGenerationFailed(String)
    case audioPlaybackFailed(String)
    case invalidInput
    
    var errorDescription: String? {
        switch self {
        case .modelNotFound:
            return "Kokoro model not found"
        case .modelLoadingFailed(let reason):
            return "Failed to load model: \(reason)"
        case .inferenceError(let reason):
            return "Model inference error: \(reason)"
        case .audioGenerationFailed(let reason):
            return "Audio generation failed: \(reason)"
        case .audioPlaybackFailed(let reason):
            return "Audio playback failed: \(reason)"
        case .invalidInput:
            return "Invalid input text"
        }
    }
}
