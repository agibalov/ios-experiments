import SwiftUI

struct ContentView: View {
    private let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    // TODO: consider using environment objects for DI
    var body: some View {
        NavigationStack {
            HomeScreen(todoRepository: todoRepository)
        }
    }
}

#Preview {
    let todoRepository = TodoRepository()
    ContentView(todoRepository: todoRepository)
}
