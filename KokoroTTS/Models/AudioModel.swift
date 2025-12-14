import Foundation

struct AudioData {
    let sampleRate: Float
    let channels: Int
    let pcmData: Data
    let duration: TimeInterval
    
    var frameCount: Int {
        let bytesPerFrame = channels * MemoryLayout<Float>.size
        return pcmData.count / bytesPerFrame
    }
}