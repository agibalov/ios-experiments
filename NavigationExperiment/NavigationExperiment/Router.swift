import SwiftUI

@Observable
class Router {
    var path = NavigationPath()
    
    private let todoRepository: TodoRepository
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
    }
    
    @ViewBuilder
    func navigate(to: Screen) -> some View {
        switch to {
        case .home:
            HomeScreen(todoRepository: todoRepository)
        case .todo(let id):
            TodoScreen(id: id, todoRepository: todoRepository)
        case .about:
            AboutScreen()
        }
    }
    
    func push(screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
