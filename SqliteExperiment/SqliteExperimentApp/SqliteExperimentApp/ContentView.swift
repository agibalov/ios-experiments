import SwiftUI
import SqliteExperimentDependencies
import struct Foundation.UUID

struct ContentView: View {
    private let db: TodoDatabase
    @State private var todos: [Todo] = []
    @State private var isCreateTodoPresented = false
    
    init(db: TodoDatabase) {
        self.db = db
    }
    
    var body: some View {
        VStack {
            if todos.count == 0 {
                Text("You don't have any todos")
            } else {
                List {
                    ForEach(todos) { todo in
                        Text(todo.text)
                            .swipeActions {
                                Button("Delete") {
                                    deleteTodo(id: todo.id)
                                }.tint(.red)
                            }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("New") {
                    isCreateTodoPresented = true
                }
            }
        }
        .task {
            loadTodos()
        }
        .sheet(isPresented: $isCreateTodoPresented) {
            CreateTodoView { text in
                createTodo(text: text)
            }
        }
    }
    
    func loadTodos() {
        todos = try! db.getTodos()
    }
    
    func createTodo(text: String) {
        try! db.putTodo(id: UUID().uuidString, text: text, done: false)
        loadTodos()
    }
    
    func deleteTodo(id: String) {
        try! db.deleteTodo(id: id)
        loadTodos()
    }
}

#Preview {
    ContentView(db: try! TodoDatabaseFactory().makeDatabase())
}
