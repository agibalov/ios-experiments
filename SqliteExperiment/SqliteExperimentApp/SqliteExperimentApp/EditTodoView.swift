import SwiftUI
import struct Foundation.UUID

struct EditTodoView: View {
    @State var text = ""
    @State var done = false
    let action: @MainActor (_ text: String, _ done: Bool) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("What needs to be done")) {
                TextEditor(text: $text)
            }
            Section(header: Text("Is it done yet?")) {
                Toggle(isOn: $done) {
                    Text("Done")
                }
            }
            Button {
                action(text, done)
                dismiss()
            } label: {
                Text("Update")
            }
        }
    }
}

#Preview {
    EditTodoView(text: "hello", done: true) { text, done in }
}
