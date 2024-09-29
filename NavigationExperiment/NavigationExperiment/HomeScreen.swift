import SwiftUI

struct HomeScreen: View {
    @State var homeViewModel: HomeViewModel
    @Environment(Router.self) var router
    
    init(todoRepository: TodoRepository) {
        _homeViewModel = State(wrappedValue: HomeViewModel(todoRepository: todoRepository))
    }
    
    var body: some View {
        VStack {
            if homeViewModel.loading {
                Text("Loading...")
            } else {
                List {
                    ForEach(homeViewModel.todos, id: \.id) { todo in
                        NavigationLink(todo.text, value: Screen.todo(id: todo.id))
                    }.onDelete { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        let id = homeViewModel.todos[index].id
                        Task {
                            await homeViewModel.delete(id: id)
                        }
                    }
                }
                
                NavigationLink("About", value: Screen.about)
                    .padding()
            }
        }
        .navigationTitle("Home")
        .task {
            await homeViewModel.load()
        }
    }
}
