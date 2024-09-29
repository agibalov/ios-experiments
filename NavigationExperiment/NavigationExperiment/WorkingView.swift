import SwiftUI

struct WorkingView<Content>: View where Content: View {
    var loading: Bool
    @ViewBuilder var content: () -> Content
    
    init(_ loading: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.loading = loading
        self.content = content
    }
    
    var body: some View {
        if loading {
            ProgressView("Working...")
                .progressViewStyle(.circular)
        } else {
            content()
        }
    }
}
