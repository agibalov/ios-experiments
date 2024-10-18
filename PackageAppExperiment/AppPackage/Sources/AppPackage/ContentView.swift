import SwiftUI

public struct ContentView: View {
    public init() {
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Spacer().frame(height: 30)
            FancyView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
