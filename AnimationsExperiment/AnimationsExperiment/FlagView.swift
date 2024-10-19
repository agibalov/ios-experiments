import SwiftUI

struct FlagView: View {
    @State private var flag = true

    var body: some View {
        VStack {
            Button("Click me") {
                withAnimation(.spring(duration: 0.3)) {
                    flag.toggle()
                }
            }
            .rotationEffect(.degrees(flag ? 0 : 90))
            .scaleEffect(flag ? 1.0 : 1.5)

            if flag {
                Text("Screen A")
                    .frame(maxWidth: .infinity)
                    .font(.largeTitle)
                    .background(.red)
                    .transition(.slide)
            } else {
                Text("Screen B")
                    .frame(maxWidth: .infinity)
                    .font(.largeTitle)
                    .background(.green)
                    .transition(.blurReplace)
            }
        }
    }
}

#Preview {
    FlagView()
}
