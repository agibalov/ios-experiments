import SwiftUI

struct FancyView: View {
    var body: some View {
        VStack {
            Button("Click me") {
                let result = addNumbers(a: 2, b: 3)
                print("result: \(result)")
            }
        }
        .padding()
    }
}

#Preview {
    FancyView()
}
