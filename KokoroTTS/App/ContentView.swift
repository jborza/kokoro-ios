import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = KokoroTTSViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Kokoro TTS")
                .font(.title)
                .fontWeight(.bold)
            
            TextEditor(text: $viewModel.inputText)
                .frame(minHeight: 150)
                .border(Color.gray)
                .padding()
                .cornerRadius(8)
            
            HStack(spacing: 12) {
                Button(action: {
                    Task {
                        await viewModel.synthesize()
                    }
                }) {
                    Text("Speak")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isProcessing ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(viewModel.isProcessing || viewModel.inputText.isEmpty)
                
                if viewModel.isPlaying {
                    Button(action: {
                        viewModel.stop()
                    }) {
                        Text("Stop")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
            
            if let status = viewModel.status {
                Text(status)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
