import SQLite

class TodoDatabaseSchema {
    public let todosTable = Table("todos")
    public let idColumn = Expression<String>("id")
    public let textColumn = Expression<String>("text")
    public let doneColumn = Expression<Bool>("done")
}
