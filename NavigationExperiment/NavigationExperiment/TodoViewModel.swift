import SwiftUI

@MainActor
@Observable
class TodoViewModel {
    private var todoRepository: TodoRepository
    
    var id: String
    var loading = true
    var todo: Todo! = nil
    
    init(id: String, todoRepository: TodoRepository) {
        self.id = id
        self.todoRepository = todoRepository
    }
    
    func load() async {
        loading = true
        todo = await todoRepository.getTodo(id: id)
        loading = false
    }
    
    func delete() async {
        loading = true
        await todoRepository.deleteTodo(id: id)
        loading = false
    }
}
