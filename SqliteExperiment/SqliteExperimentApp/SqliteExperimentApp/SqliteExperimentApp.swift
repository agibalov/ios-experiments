import SwiftUI

@main
struct SqliteExperimentApp: App {
    private let dbService: TodoDatabaseService
    private let db: TodoDatabase
    
    init() {
        dbService = TodoDatabaseService()
        db = try! dbService.makePersistentDatabase()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(dbService: dbService, db: db)
            }
        }
    }
}
