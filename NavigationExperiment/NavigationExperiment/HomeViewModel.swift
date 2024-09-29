import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    private let todoRepository: TodoRepository
    
    @Published var loading = true
    @Published var todos: [Todo] = []
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    func load() async throws {
        loading = true
        todos = try! await todoRepository.getTodos()
        loading = false
    }
    
    func delete(id: String) async throws {
        loading = true
        try! await todoRepository.deleteTodo(id: id)
        todos = try! await todoRepository.getTodos()
        loading = false
    }
}
