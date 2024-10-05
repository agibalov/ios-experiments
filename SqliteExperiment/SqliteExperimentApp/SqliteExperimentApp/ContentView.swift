import SwiftUI
import SqliteExperimentDependencies
import struct Foundation.UUID

struct ContentView: View {
    private let dbService: TodoDatabaseService
    private let db: TodoDatabase
    @State private var todos: [Todo] = []
    @State private var isCreateTodoPresented = false
    @State private var editTodo: Todo!
    
    init(dbService: TodoDatabaseService, db: TodoDatabase) {
        self.dbService = dbService
        self.db = db
    }
    
    var body: some View {
        VStack {
            if todos.count == 0 {
                Text("You don't have any todos")
            } else {
                List {
                    ForEach(todos) { todo in
                        VStack(alignment: .leading) {
                            Text(todo.text)
                            Text(todo.done ? "Done" : "Not Done")
                                .fontWeight(.bold)
                        }
                        .swipeActions {
                            Button("Edit") {
                                editTodo = todo
                            }
                            Button("Delete") {
                                deleteTodo(id: todo.id)
                            }.tint(.red)
                        }
                    }
                }
                .sheet(item: $editTodo) { item in
                    EditTodoView(text: item.text, done: item.done) { text, done in
                        updateTodo(id: item.id, text: text, done: done)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("Drop DB") {
                    try! dbService.dropDatabase()
                }
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
    
    func updateTodo(id: String, text: String, done: Bool) {
        try! db.putTodo(id: id, text: text, done: done)
        loadTodos()
    }
    
    func deleteTodo(id: String) {
        try! db.deleteTodo(id: id)
        loadTodos()
    }
}

#Preview {
    let dbService = TodoDatabaseService()
    let db = try! dbService.makeInMemoryDatabase()
    ContentView(dbService: dbService, db: db)
}
