import func Foundation.NSSearchPathForDirectoriesInDomains
import struct Foundation.UUID
import class Foundation.FileManager
import struct Foundation.URL
import SQLite

class TodoDatabaseService : TodoDatabaseSchema {
    func makePersistentDatabase() throws -> TodoDatabase {
        let dbFileUrl = getFileUrl()
        let dbExists = FileManager.default.fileExists(atPath: dbFileUrl.path())
        
        let connection = try Connection(dbFileUrl.absoluteString)
        
        if !dbExists {
            try! createSchema(connection: connection)
        }
        
        return TodoDatabase(connection: connection)
    }
    
    func makeInMemoryDatabase() throws -> TodoDatabase {
        let connection = try Connection()
        try! createSchema(connection: connection)
        return TodoDatabase(connection: connection)
    }
    
    func dropDatabase() throws {
        let dbFileUrl = getFileUrl()
        try FileManager.default.removeItem(at: dbFileUrl)
    }
    
    private func getFileUrl() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = path.appendingPathComponent("todos.sqlite3")
        return fileUrl
    }
    
    private func createSchema(connection: Connection) throws {
        try! connection.run(todosTable.create { table in
            table.column(idColumn, primaryKey: true)
            table.column(textColumn)
            table.column(doneColumn)
        })
    }
}
