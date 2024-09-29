import SwiftUI

struct TodoScreen: View {
    @State private var todoViewModel: TodoViewModel
    @Environment(Router.self) var router
    
    init(id: String, todoRepository: TodoRepository) {
        _todoViewModel = State(wrappedValue: TodoViewModel(id: id, todoRepository: todoRepository))
    }
    
    var body: some View {
        WorkingView(todoViewModel.loading) {
            VStack {
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
                        router.popToRoot()
                    }
                }
            }
        }
        .task {
            await todoViewModel.load()
        }
    }
}
