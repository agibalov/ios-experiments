import SwiftUI

struct FavoriteView: View {
    @State private var flag = true

    var body: some View {
        VStack {
            Image(systemName: "square.stack.3d.up")
                .symbolEffect(.variableColor.iterative, value: flag)

            Button {
                withAnimation {
                    flag.toggle()
                }
            } label: {
                Label("Toggle Favorite (flag=\(flag))", systemImage: flag ? "checkmark" : "heart")
            }
            .contentTransition(.symbolEffect(.replace))
        }
    }
}

#Preview {
    FavoriteView()
}
