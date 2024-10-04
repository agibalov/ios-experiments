import SwiftUI
import struct Foundation.UUID

struct CreateTodoView: View {
    let action: @MainActor (_ text: String) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @State private var text: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("What needs to be done")) {
                TextEditor(text: $text)
            }
            Button {
                action(text)
                dismiss()
            } label: {
                Text("Create")
            }
        }
    }
}

#Preview {
    CreateTodoView() { text in }
}
