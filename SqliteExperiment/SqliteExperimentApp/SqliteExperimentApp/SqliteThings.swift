import func Foundation.NSSearchPathForDirectoriesInDomains
import struct Foundation.UUID
import SQLite

func doSqliteThings() {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    do {
        let todoDatabaseFactory = TodoDatabaseFactory()
        let db = try todoDatabaseFactory.makeDatabase()
        
        try db.putTodo(id: UUID().uuidString, text: "Get some milk", done: true)
        try db.putTodo(id: UUID().uuidString, text: "Get some coffee", done: false)
        
        for todo in try db.getTodos() {
            print("id=\(todo.id) text=\(todo.text) done=\(todo.done)")
        }
        
        print("count=\(try db.getCount())")
    } catch {
        print("Error: \(error)")
    }
}
