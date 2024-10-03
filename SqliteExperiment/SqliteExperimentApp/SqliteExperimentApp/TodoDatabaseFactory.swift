import func Foundation.NSSearchPathForDirectoriesInDomains
import struct Foundation.UUID
import SQLite

class TodoDatabaseFactory : TodoDatabaseSchema {
    func makeDatabase() throws -> TodoDatabase {
        let connection = try Connection()
        
        try connection.run(todosTable.create(ifNotExists: true) { table in
            table.column(idColumn, primaryKey: true)
            table.column(textColumn)
            table.column(doneColumn)
        })
        
        return TodoDatabase(connection: connection)
    }
}
