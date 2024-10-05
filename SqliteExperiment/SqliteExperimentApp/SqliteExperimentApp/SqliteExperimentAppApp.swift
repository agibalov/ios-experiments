import SwiftUI

@main
struct SqliteExperimentAppApp: App {
    private let dbService: TodoDatabaseService
    private let db: TodoDatabase
    
    init() {
        dbService = TodoDatabaseService()
        db = try! dbService.makeDatabase()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(dbService: dbService, db: db)
            }
        }
    }
}
