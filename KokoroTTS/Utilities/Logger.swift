import Foundation

struct Logger {
    enum LogLevel {
        case info
        case warning
        case error
    }
    
    static func log(_ message: String, level: LogLevel = .info) {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let levelString: String
        
        switch level {
        case .info:
            levelString = "ℹ️ INFO"
        case .warning:
            levelString = "⚠️ WARN"
        case .error:
            levelString = "❌ ERROR"
        }
        
        print("[\(timestamp)] [\(levelString)] \(message)")
    }
    
    static func info(_ message: String) {
        log(message, level: .info)
    }
    
    static func warning(_ message: String) {
        log(message, level: .warning)
    }
    
    static func error(_ message: String) {
        log(message, level: .error)
    }
}
