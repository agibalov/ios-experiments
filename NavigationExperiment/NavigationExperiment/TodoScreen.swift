import SwiftUI

struct TodoScreen: View {
    @State private var todoViewModel: TodoViewModel
    @Environment(Router.self) var router
    
    init(id: String, todoRepository: TodoRepository) {
        _todoViewModel = State(wrappedValue: TodoViewModel(id: id, todoRepository: todoRepository))
    }
    
    var body: some View {
        VStack {
            if todoViewModel.loading {
                Text("Loading...")
            } else {
                Text(todoViewModel.todo.text)
                Text("Done: \(todoViewModel.todo.done)")
            }
        }
        .navigationTitle("Todo")
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("Delete") {
                    Task {
                        await todoViewModel.delete()
                        router.path.removeLast(router.path.count)
                    }
                }
                
                Button("Edit") {
                    // TODO
                    print("Edit todo #\(todoViewModel.todo.id)")
                }
            }
        }
        .task {
            await todoViewModel.load()
        }
    }
}
