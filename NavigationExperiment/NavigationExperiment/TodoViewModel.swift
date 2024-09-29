import SwiftUI

@MainActor
class TodoViewModel: ObservableObject {
    private let id: String
    private let todoRepository: TodoRepository
    
    @Published var loading = true
    @Published var todo: Todo! = nil
    
    init(id: String, todoRepository: TodoRepository) {
        self.id = id
        self.todoRepository = todoRepository
    }
    
    func load() async throws {
        loading = true
        todo = try! await todoRepository.getTodo(id: id)
        loading = false
    }
    
    func delete() async throws {
        loading = true
        try! await todoRepository.deleteTodo(id: id)
        loading = false
    }
}
