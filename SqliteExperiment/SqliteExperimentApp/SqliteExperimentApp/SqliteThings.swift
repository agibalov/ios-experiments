import func Foundation.NSSearchPathForDirectoriesInDomains
import SQLite

func doSqliteThings() {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    do {
        //let db = try Connection("\(path)/db.sqlite3")
        
        let db = try Connection() // in-memory
        
        let todos = Table("todos")
        let id = Expression<Int64>("id")
        let text = Expression<String>("text")
        
        try db.run(todos.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(text)
        })
        
        try db.run(todos.insert(or: .replace, id <- 1, text <- "Get some milk"))
        try db.run(todos.insert(or: .replace, id <- 2, text <- "Get some coffee"))
        
        for todo in try db.prepare(todos.select(id, text)) {
            print("id: \(todo[id]), text: \(todo[text])")
        }
        
        let count = try db.scalar(todos.count)
        print("count=\(count)")
    } catch {
        print("Error: \(error)")
    }
}
