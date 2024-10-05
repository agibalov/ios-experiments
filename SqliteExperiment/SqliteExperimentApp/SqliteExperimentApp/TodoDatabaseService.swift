import func Foundation.NSSearchPathForDirectoriesInDomains
import struct Foundation.UUID
import class Foundation.FileManager
import struct Foundation.URL
import SQLite

class TodoDatabaseService : TodoDatabaseSchema {
    func makeDatabase() throws -> TodoDatabase {
        let dbFileUrl = getFileUrl()
        let dbExists = FileManager.default.fileExists(atPath: dbFileUrl.path())
        
        let connection = try Connection(dbFileUrl.absoluteString)
        
        if !dbExists {
            // TODO: get rid of ifNotExists: true - figure out why Xcode shows errors without it
            try connection.run(todosTable.create(ifNotExists: true) { table in
                table.column(idColumn, primaryKey: true)
                table.column(textColumn)
                table.column(doneColumn)
            })
        }
        
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
}
