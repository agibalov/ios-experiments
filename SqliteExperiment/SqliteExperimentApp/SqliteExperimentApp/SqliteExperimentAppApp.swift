import SwiftUI

@main
struct SqliteExperimentAppApp: App {
    private let db = try! TodoDatabaseFactory().makeDatabase()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(db: db)
            }
        }
    }
}
