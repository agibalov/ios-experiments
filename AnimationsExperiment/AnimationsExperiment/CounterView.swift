import SwiftUI

struct CounterView: View {
    @State private var count = 0
    @State private var shouldStop = false
    @State private var timer: Timer!

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolEffect(.bounce, value: count)
            
            Text("Count: \(count)")
                .font(.title)
                .transition(.blurReplace)
                .id("helloWorld\(count)")

            Text("Count: \(count)")
                .font(.title)
                .contentTransition(.numericText())
        }.onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation(.spring(duration: 0.8)) {
                    count += 1
                }
            }
        }.onDisappear {
            timer.invalidate()
        }
    }
}

#Preview {
    CounterView()
}
