import SwiftUI

@MainActor
@Observable
class HomeViewModel {
    private var todoRepository: TodoRepository
    
    var loading = true
    var todos: [Todo] = []
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    func load() async {
        loading = true
        todos = await todoRepository.getTodos()
        loading = false
    }
    
    func delete(id: String) async {
        loading = true
        await todoRepository.deleteTodo(id: id)
        todos = await todoRepository.getTodos()
        loading = false
    }
}
