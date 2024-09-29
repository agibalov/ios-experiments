import SwiftUI

@main
struct NavigationExperimentApp: App {
    private let todoRepository = TodoRepository()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environment(Router(todoRepository: todoRepository))
    }
}
