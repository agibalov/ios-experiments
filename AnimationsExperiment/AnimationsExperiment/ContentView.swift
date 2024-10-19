import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Clock", systemImage: "star") {
                CounterView()
            }

            Tab("Flag", systemImage: "restart.circle") {
                FlagView()
            }

            Tab("Favorite", systemImage: "moon.stars") {
                FavoriteView()
            }
        }
    }
}

#Preview {
    ContentView()
}
