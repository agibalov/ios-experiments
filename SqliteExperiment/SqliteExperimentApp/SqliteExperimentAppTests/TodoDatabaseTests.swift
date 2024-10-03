import Testing
import struct Foundation.UUID
@testable import SqliteExperimentApp

class TodoDatabaseTests {
    var db: TodoDatabase
    
    init() throws {
        let todoDatabaseFactory = TodoDatabaseFactory()
        db = try todoDatabaseFactory.makeDatabase()
    }
    
    deinit {
    }

    @Test
    func canCreateATodo() throws {
        try db.putTodo(id: "a", text: "Get some milk", done: true)
        
        #expect(try db.getCount() == 1)
        
        let todo = try db.getTodo(id: "a")!
        #expect(todo.id == "a")
        #expect(todo.text == "Get some milk")
        #expect(todo.done == true)
    }
    
    @Test
    func canUpdateATodo() throws {
        try db.putTodo(id: "a", text: "Get some milk", done: true)
        try db.putTodo(id: "a", text: "Get some coffee", done: false)
        
        #expect(try db.getCount() == 1)
        
        let todo = try db.getTodo(id: "a")!
        #expect(todo.id == "a")
        #expect(todo.text == "Get some coffee")
        #expect(todo.done == false)
    }
    
    @Test
    func canDeleteATodo() throws {
        try db.putTodo(id: "a", text: "Get some milk", done: true)
        try db.deleteTodo(id: "a")
        
        #expect(try db.getCount() == 0)
        
        let todo = try db.getTodo(id: "a")
        #expect(todo == nil)
    }
    
    @Test
    func canGetAllTodos() throws {
        try db.putTodo(id: "a", text: "Get some milk", done: true)
        try db.putTodo(id: "b", text: "Get some coffee", done: false)
        try db.putTodo(id: "c", text: "Get some sugar", done: true)
        
        #expect(try db.getCount() == 3)
        
        let todos = try db.getTodos()
        #expect(todos.count == 3)
        
        #expect(todos[0].id == "a")
        #expect(todos[0].text == "Get some milk")
        #expect(todos[0].done == true)
        
        #expect(todos[1].id == "b")
        #expect(todos[1].text == "Get some coffee")
        #expect(todos[1].done == false)
        
        #expect(todos[2].id == "c")
        #expect(todos[2].text == "Get some sugar")
        #expect(todos[2].done == true)
    }
}
