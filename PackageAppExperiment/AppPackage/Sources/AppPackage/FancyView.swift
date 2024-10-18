import SwiftUI

@available(iOS 13.0.0, *)
public struct FancyView: View {
    public init() {
    }
    
    public var body: some View {
        VStack {
            Button("Click me") {
                let result = addNumbers(a: 2, b: 3)
                print("result: \(result)")
            }
        }
        .padding()
    }
}

@available(iOS 15.0.0, *)
#Preview {
    FancyView()
}
