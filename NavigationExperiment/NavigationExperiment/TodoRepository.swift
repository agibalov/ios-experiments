import SwiftUI

class TodoRepository {
    private var todos = [
        Todo(id: "1", text: "Get some tea", done: false),
        Todo(id: "2", text: "Get some coffee", done: false),
        Todo(id: "3", text: "Get some milk", done: true)
    ]
    
    func getTodos() async throws -> [Todo] {
        try await sleep()
        return todos
    }
    
    func getTodo(id: String) async throws -> Todo? {
        try await sleep()
        return todos.first(where: { todo in todo.id == id })
    }
    
    func deleteTodo(id: String) async throws {
        try await sleep()
        todos.remove(at: todos.firstIndex(where: { todo in todo.id == id })!)
    }
    
    private func sleep() async throws {
        try await Task.sleep(nanoseconds: 3_000_000_000)
    }
}
