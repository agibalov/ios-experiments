import SwiftUI

class TodoRepository {
    private var todos = [
        Todo(id: "1", text: "Get some tea", done: false),
        Todo(id: "2", text: "Get some coffee", done: false),
        Todo(id: "3", text: "Get some milk", done: true)
    ]
    
    func getTodos() async -> [Todo] {
        await sleep()
        return todos
    }
    
    func getTodo(id: String) async -> Todo? {
        await sleep()
        return todos.first(where: { todo in todo.id == id })
    }
    
    func deleteTodo(id: String) async {
        await sleep()
        guard let index = todos.firstIndex(where: { todo in todo.id == id }) else {
            print("\(id) doesn't exist")
            return
        }
        todos.remove(at: index)
    }
    
    private func sleep() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            print("sleep() had an exception")
        }
    }
}
