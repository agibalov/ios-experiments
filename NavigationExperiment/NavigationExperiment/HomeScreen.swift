import SwiftUI

struct HomeScreen: View {
    private let todoRepository: TodoRepository
    
    @StateObject var homeViewModel: HomeViewModel
    
    init(todoRepository: TodoRepository) {
        self.todoRepository = todoRepository
        _homeViewModel = StateObject(wrappedValue: HomeViewModel(todoRepository: todoRepository))
    }
    
    var body: some View {
        VStack {
            if homeViewModel.loading {
                Text("Loading...")
            } else {
                List {
                    ForEach(homeViewModel.todos, id: \.id) { todo in
                        NavigationLink(todo.text, value: todo.id)
                    }.onDelete { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        let id = homeViewModel.todos[index].id
                        Task {
                            try! await homeViewModel.delete(id: id)
                        }
                    }
                }
                .navigationDestination(for: String.self) { id in
                    TodoScreen(id: id, todoRepository: todoRepository) // TODO: how do I get this constructed elsewhere?
                }
                
                NavigationLink("About") {
                    AboutScreen()
                }
            }
        }
        .navigationTitle("Home")
        .task {
            try! await homeViewModel.load()
        }
    }
}
