import SwiftUI

@available(iOS 15.0.0, *)
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

@available(iOS 15.0.0, *)
#Preview {
    ContentView()
}
