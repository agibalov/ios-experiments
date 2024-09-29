import SwiftUI

struct TodoScreen: View {
    @StateObject private var todoViewModel: TodoViewModel
    
    init(id: String, todoRepository: TodoRepository) {
        _todoViewModel = StateObject(wrappedValue: TodoViewModel(id: id, todoRepository: todoRepository))
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
                        try! await todoViewModel.delete()
                        // TODO: navigate to home screen
                    }
                }
                
                Button("Edit") {
                    // TODO
                    print("Edit todo #\(todoViewModel.todo.id)")
                }
            }
        }
        .task {
            try! await todoViewModel.load()
        }
    }
}
