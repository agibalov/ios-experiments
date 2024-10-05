import SQLite

class TodoDatabase : TodoDatabaseSchema {
    private let connection: Connection
    
    init(connection: Connection) {
        self.connection = connection
    }
    
    func getTodos() throws -> [Todo] {
        var todos: [Todo] = []
        for todoRow in try connection.prepare(todosTable.select(idColumn, textColumn, doneColumn).order(idColumn)) {
            todos.append(makeTodo(todoRow: todoRow))
        }
        return todos
    }
    
    func getTodo(id: String) throws -> Todo? {
        if let todoRow = try connection.pluck(todosTable.filter(idColumn == id)) {
            return makeTodo(todoRow: todoRow)
        }
        return nil
    }
    
    func deleteTodo(id: String) throws {
        try connection.run(todosTable.filter(idColumn == id).delete())
    }
    
    func putTodo(id: String, text: String, done: Bool) throws {
        try connection.run(todosTable.upsert(idColumn <- id, textColumn <- text, doneColumn <- done, onConflictOf: idColumn))
    }
    
    func getCount() throws -> Int {
        return try connection.scalar(todosTable.count)
    }
    
    private func makeTodo(todoRow: Row) -> Todo {
        return Todo(id: todoRow[idColumn], text: todoRow[textColumn], done: todoRow[doneColumn])
    }
}
