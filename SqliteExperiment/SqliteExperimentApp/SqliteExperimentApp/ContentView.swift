import SwiftUI
import SqliteExperimentDependencies

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Button("Call dummy() from SqliteExperimentDependencies package") {
                dummy()
            }
            
            Spacer().frame(height: 50)
            
            Button("Call doSqliteThings()") {
                doSqliteThings()
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
