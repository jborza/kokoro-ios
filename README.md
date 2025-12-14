# Kokoro TTS iOS App

A simple iOS app that uses the Kokoro text-to-speech model locally on-device for privacy-preserving audio generation.

## Features

- 📱 Clean SwiftUI interface
- 🗣️ Local Kokoro TTS processing (no API calls)
- 🔐 Complete privacy - all processing happens on device
- 🎧 Audio playback with play/stop controls
- 📊 MVVM architecture
- ✅ Unit tests

## Requirements

- iOS 17+
- iPhone 14+
- Xcode 15+
- Kokoro Core ML model (converted to `.mlmodelc` format)

## Setup

### 1. Add Kokoro Model

1. Convert your Kokoro model to Core ML format (`.mlmodelc`)
2. Copy the model file to `KokoroTTS/Resources/Models/`
3. In Xcode, add the model to the target
4. Update the model path in `KokoroModel.swift` if needed

### 2. Build & Run

```bash
git clone https://github.com/jborza/kokoro-ios.git
cd kokoro-ios
open kokoro-ios.xcodeproj
```

Select iPhone 14+ simulator or device and press Run.

## Project Structure

```
KokoroTTS/
├── App/                 # App entry point and main UI
├── ViewModels/          # MVVM ViewModels
├── Models/              # Data models and Core ML wrapper
├── Services/            # Business logic (Core ML, Audio, TTS)
├── Utilities/           # Helper utilities (Logger, AudioConverter)
└── Resources/           # Assets and Kokoro model
```

## Architecture

### MVVM Pattern
- **Views**: SwiftUI UI components
- **ViewModels**: State management and business logic coordination
- **Models**: Data structures and Core ML model wrapper
- **Services**: Separated concerns (CoreML inference, audio playback, TTS orchestration)

### Data Flow

```
User Input
    ↓
ContentView
    ↓
KokoroTTSViewModel
    ↓
TTSService
    ↓
CoreMLService (Kokoro Model) → AudioService (Playback)
    ↓
Audio Output
```

## TODO

- [ ] Implement actual Kokoro model inference in `KokoroModel.swift`
- [ ] Implement PCM to WAV conversion in `AudioConverter.swift`
- [ ] Add model download functionality
- [ ] Add voice selection options
- [ ] Add speech speed control
- [ ] Add audio file saving capability
- [ ] Add speech history
- [ ] Improve UI with more controls

## Configuration

### Audio Permissions

The app requires audio playback permissions configured in `Info.plist`:

```xml
<key>NSMicrophoneUsageDescription</key>
<string>Microphone access not required for playback</string>
```

### Audio Session

The audio session is configured for playback with other audio apps (duck volume).

## Error Handling

The app includes custom error types for:
- Model loading failures
- Inference errors
- Audio generation failures
- Playback failures

All errors are logged and displayed to the user.

## Testing

Unit tests are included for:
- ViewModel state management
- Audio service playback
- Core ML service inference

Run tests:
```bash
⌘ + U
```

## License

MIT

## Resources

- [Kokoro TTS GitHub](https://github.com/remsky/Kokoro-82M)
- [Apple Core ML Documentation](https://developer.apple.com/documentation/coreml)
- [AVFoundation Audio Documentation](https://developer.apple.com/documentation/avfoundation)
