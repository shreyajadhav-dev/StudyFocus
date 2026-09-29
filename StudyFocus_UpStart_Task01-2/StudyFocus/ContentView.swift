import SwiftUI

struct ContentView: View {
    @State private var studyMinutes = 25
    @State private var focusMode = false
    @State private var isStudying = false

    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: isStudying ? "book.fill" : "book")
                .font(.system(size: 60))
                .foregroundStyle(.purple)

            Text("Study Focus")
                .font(.largeTitle)
                .bold()

            Text(isStudying
                 ? "Your study session is running!"
                 : "Ready to start studying?")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Stepper(
                "Study Time: \(studyMinutes) min",
                value: $studyMinutes,
                in: 5...120,
                step: 5
            )
            .padding()
            .background(.purple.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Toggle("Focus Mode", isOn: $focusMode)
                .padding()
                .background(.purple.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Button {
                isStudying.toggle()
            } label: {
                Text(isStudying ? "Stop Session" : "Start Session")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isStudying ? .red : .purple)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }

            if focusMode {
                Label("Focus Mode is ON", systemImage: "moon.fill")
                    .foregroundStyle(.purple)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
